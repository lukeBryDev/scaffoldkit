library scaffoldkit;

import 'dart:io';
import 'dart:isolate';
import 'package:path/path.dart' as p;

import 'settings.dart';

/// Entry point for the scaffolding process.
/// It takes the project name as an argument, performs file scaffolding,
/// and installs the required dependencies.
Future<void> main(List<String> arguments) async {
  print('👀 STARTING . . .');

  // Check if the project name was provided as an argument
  if (arguments.isEmpty) {
    print('Please provide the project name.');
    return;
  }

  final String projectName = arguments[0];

  await Future.wait([
    /// Step 1: Copy template files and replace the placeholder {PROJECT_NAME}
    _fileScaffolding(projectName),

    /// Step 2: Install required dependencies from pub.dev
    _installRequiredPackages()
  ]);

  print('🔥 READY TO ROCK!');
}

/// Function to handle the file scaffolding process.
/// It will copy files from the package and replace the placeholder {PROJECT_NAME}
/// with the actual project name.
Future<void> _fileScaffolding(String projectName) async {
  print('🗂️ SCAFFOLDING PROCESS: init');

  // Resolve the package URI to locate the template files within the package
  final uri = await Isolate.resolvePackageUri(Uri.parse(
      'package:scaffoldkit/')); // Replace with your actual package name

  if (uri == null) {
    print('Source files not found');
    return;
  }

  final sourceDir = Directory(uri.path);
  if (!sourceDir.existsSync()) {
    print('Source directory not found');
    return;
  }

  // Copy files and replace {PROJECT_NAME} with the actual project name
  _copyAndReplacePackageName(sourceDir, projectName);

  print('🗂️ SCAFFOLDING PROCESS: completed');
}

/// Function to copy files from the source directory and replace the placeholder
/// {PROJECT_NAME} with the actual project name in the contents of the files.
///
/// [sourceDir]: The directory containing the template files.
/// [projectName]: The actual project name to replace the {PROJECT_NAME} placeholder.
Future<void> _copyAndReplacePackageName(
    Directory sourceDir, String projectName) async {
  for (final entity in sourceDir.listSync(recursive: true)) {
    if (entity is File) {
      final relativePath = p.relative(entity.path, from: sourceDir.path);
      final targetPath = p.join(Directory.current.path, 'lib/$relativePath');

      final targetFile = File(targetPath);
      targetFile.createSync(recursive: true);

      // Read the contents of the source file
      String content = entity.readAsStringSync();

      // Replace {PROJECT_NAME} with the actual project name
      content = content.replaceAll('{PROJECT_NAME}', projectName);

      // Write the modified content to the target file
      targetFile.writeAsStringSync(content);

      print('Copied and replaced ${entity.path} to ${targetFile.path}');
    }
  }
}

/// Function to install the required dependencies for the project.
/// It installs packages listed in the [requiredPackages] array via `flutter pub add`.
Future<void> _installRequiredPackages() async {
  print('📚 PACKAGES INSTALLING PROCESS: init');

  for (final package in requiredPackages) {
    if (package == 'flutter_localizations') {
      // Special case for 'flutter_localizations', which should be added manually to pubspec.yaml
      print(
          'To install the $package dependency, copy and paste the following lines into pubspec.yaml:\n'
          'flutter_localizations:\n'
          '  sdk: flutter');
    } else {
      print('Installing package: $package...');

      // Executes the "flutter pub add {package}" command
      final result = await Process.run('flutter', ['pub', 'add', package]);

      if (result.exitCode == 0) {
        print('Package $package installed successfully.');
      } else {
        print('Error installing $package: ${result.stderr}');
      }
    }
  }

  // Run `flutter pub get` to fetch all dependencies
  await Process.run('flutter', ['pub', 'get']);

  print('📚 PACKAGES INSTALLING PROCESS: completed');
}
