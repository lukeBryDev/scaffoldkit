library scaffoldkit;

import 'dart:io';

import 'settings.dart';

void main(List<String> arguments) {
  print('👀 STARTING . . .');
  if (arguments.isEmpty) {
    print('Por favor, proporciona el nombre del proyecto.');
    return;
  }

  final projectName = arguments[0];
  final baseDir = Directory.current;

  /// Generate the folder structure
  _createFolderStructure(baseDir);

  /// Copy files and replace {PROJECT_NAME}
  _copyAndReplaceFiles(projectName);

  /// Install dependencies from pub.dev
  // _installRequiredPackages();
  print('🔥 READY TO ROCK!');
}

void _createFolderStructure(Directory baseDir) {
  print('🗂️ FOLDER CREATION PROCESS: init');
  for (final dir in directories) {
    final newDir = Directory('${baseDir.path}/$dir');
    if (!newDir.existsSync()) {
      newDir.createSync(recursive: true);
      print('Folder $newDir created');
    }
  }
  print('🗂️ FOLDER CREATION PROCESS: finish');
}

// Función para copiar archivos y reemplazar {PROJECT_NAME}
void _copyAndReplaceFiles(String projectName) {
  print('📄 FILES CREATING PROCESS: init');
  files.forEach((sourcePath, targetPath) {
    final file = File(sourcePath);

    // Verifica si el archivo fuente existe
    if (file.existsSync()) {
      // Leer el contenido del archivo fuente
      String content = file.readAsStringSync();

      // Reemplaza {PROJECT_NAME} con el nombre del proyecto
      content = content.replaceAll('{PROJECT_NAME}', projectName);

      // Asegúrate de que el directorio del archivo de destino exista
      final targetFile = File(targetPath);
      if (!targetFile.parent.existsSync()) {
        targetFile.parent
            .createSync(recursive: true); // Crear los directorios de destino
      }

      // Escribir el archivo en la ruta de destino
      targetFile.writeAsStringSync(content);
      print('File $sourcePath copied to: $targetPath');
    } else {
      print('The origin file doesn\'t exist in: ${file.path}');
    }
  });
  print('📄 FILES CREATING PROCESS: finish');
}

// Función para instalar los paquetes requeridos
void _installRequiredPackages() async {
  print('📚 PACKAGES INSTALLING PROCESS: init');
  for (final package in requiredPackages) {
    print('Instalando paquete: $package...');

    // Ejecuta el comando "flutter pub add {package}"
    final result = await Process.run('flutter', ['pub', 'add', package]);

    if (result.exitCode == 0) {
      print('Paquete $package instalado correctamente.');
    } else {
      print('Error al instalar $package: ${result.stderr}');
    }
  }
  await Process.run('flutter', ['pub', 'get']);
  print('📚 PACKAGES INSTALLING PROCESS: finish');
}
