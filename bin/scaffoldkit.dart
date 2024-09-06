library scaffoldkit;

import 'dart:io';
import 'dart:isolate';

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

  _copyAndReplacePackageName(uri.toFilePath(), projectName);
  // _copyAndReplacePackageNameV1(sourceDir, projectName);

  print('📄 FILES CREATING PROCESS: completed');
}

Future<void> _copyAndReplacePackageName(
    String sourcePath, String projectName) async {
  for (final path in files) {
    final file = File('$sourcePath/$path');

// Verifica si el archivo fuente existe
    if (file.existsSync()) {
// Leer el contenido del archivo fuente
      String content = file.readAsStringSync();

// Reemplaza {PROJECT_NAME} con el nombre del proyecto
      content = content.replaceAll('{PROJECT_NAME}', projectName);

// Asegúrate de que el directorio del archivo de destino exista
      final targetFile = File('lib/$path');
      if (!targetFile.parent.existsSync()) {
        targetFile.parent
            .createSync(recursive: true); // Crear los directorios de destino
      }

// Escribir el archivo en la ruta de destino
      targetFile.writeAsStringSync(content);
      print('File ${file.path} copied to: lib/$path');
    } else {
      print('The origin file doesn\'t exist in: $path');
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
