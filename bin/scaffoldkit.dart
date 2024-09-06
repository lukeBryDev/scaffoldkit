library scaffoldkit;

import 'dart:io';
import 'dart:isolate';
import 'package:path/path.dart' as p;

import 'settings.dart';

Future<void> main(List<String> arguments) async {
  print('👀 STARTING . . .');

  if (arguments.isEmpty) {
    print('Por favor, proporciona el nombre del proyecto.');
    return;
  }

  final String projectName = arguments[0];

  /// Copy files and replace {PROJECT_NAME}
  await _fileScaffolding(projectName);

  /// Install dependencies from pub.dev
  await _installRequiredPackages();
  print('🔥 READY TO ROCK!');
}

// Función para copiar archivos y reemplazar {PROJECT_NAME}
Future<void> _fileScaffolding(String projectName) async {
  print('📄 FILES CREATING PROCESS: init');

  // Resuelve la URI del archivo que quieres acceder desde el package
  final uri = await Isolate.resolvePackageUri(
      Uri.parse('package:scaffoldkit/')); // Reemplaza por tu package

  if (uri == null) {
    print('Source file not found');
    return;
  }

  final sourceDir = Directory(uri.path);
  if (!sourceDir.existsSync()) {
    print('Source directory not found');
    return;
  }

  _copyAndReplacePackageName(sourceDir, projectName);
  // _copyAndReplacePackageNameV1(sourceDir, projectName);

  print('📄 FILES CREATING PROCESS: completed');
}

Future<void> _copyAndReplacePackageName(
    Directory sourceDir, String projectName) async {
  for (final entity in sourceDir.listSync(recursive: true)) {
    if (entity is File) {
      final relativePath = p.relative(entity.path, from: sourceDir.path);
      final targetPath = p.join(Directory.current.path, 'lib/$relativePath');

      final targetFile = File(targetPath);
      targetFile.createSync(recursive: true);

      // Leer el contenido del archivo original
      String content = entity.readAsStringSync();

      // Reemplazar {PROJECT_NAME} por el nombre del proyecto
      content = content.replaceAll('{PROJECT_NAME}', projectName);

      // Escribir el contenido modificado en el archivo de destino
      targetFile.writeAsStringSync(content);

      print('Copied and replaced ${entity.path} to ${targetFile.path}');
    }
  }
}

// Función para instalar los paquetes requeridos
Future<void> _installRequiredPackages() async {
  print('📚 PACKAGES INSTALLING PROCESS: init');
  for (final package in requiredPackages) {
    if (package == 'flutter_localizations') {
      print(
          'For install $package dependency, copy and paste these lines below in pubspec.yaml:\n '
          'flutter_localizations:\n'
          '  sdk: flutter');
    } else {
      print('Instalando paquete: $package...');

      // Ejecuta el comando "flutter pub add {package}"
      final result = await Process.run('flutter', ['pub', 'add', package]);

      if (result.exitCode == 0) {
        print('Paquete $package instalado correctamente.');
      } else {
        print('Error al instalar $package: ${result.stderr}');
      }
    }
  }
  await Process.run('flutter', ['pub', 'get']);
  print('📚 PACKAGES INSTALLING PROCESS: finish');
}
