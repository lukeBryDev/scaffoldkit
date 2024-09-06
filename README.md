# ScaffoldKit

**ScaffoldKit** is a Flutter package that automates the creation of a base folder structure based on
clean architecture and updates import statements according to the project's name. It also automatically
installs a list of essential packages from **pub.dev** to streamline the setup of your projects.

## Features

- Generates a predefined folder structure in `lib/`.
- Copies base template files, adjusting imports according to the project name.
- Automatically installs common dependencies from **pub.dev**.

## Installation

### From GitHub

To use **ScaffoldKit** directly from GitHub, follow these steps:

1. Add **ScaffoldKit** as a dependency in your `pubspec.yaml` file:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     scaffoldkit:
       git:
         url: https://github.com/lukeBryDev/scaffoldkit.git
         ref: main
   ```
2. Run `flutter pub` get to install the dependencies:

   ```bash 
   flutter pub get
   ```

## Usage

### Generate the Base Folder Structure and Install Dependencies

1. Once **ScaffoldKit** is installed, run the following command to generate the folder structure and
   base files, and also install common **pub.dev** dependencies. Replace <project_name> with the
   name of the project you are working on:

```bash
flutter pub run scaffoldkit <project_name>
```

This command will perform the following actions:

- Create the predefined folders inside `lib/src/app/`.
- Copy the base files to the newly created folders.
- Replace all occurrences of `{scaffoldkit/templates}` in the import statements with the project’s
  name.
- Automatically install the following packages from pub.dev:
    - `flutter_localizations`
    - `intl`
    - `go_router`
    - `equatable`
    - `dio`
    - `dartz`
    - `package_info_plus`
    - `get_it`

## Generated Structure

After running the command, your project structure will look something like this:

```css
lib/
└── main.dart
└── injection_container.dart
└── src/
│   ├── config/
│   └── features/
│       ├── app/
│       ├── data/
│       └── domain/
```

The example_screen.dart file might look like this:

```dart
import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  static const name = 'example-screen';

  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Placeholder());
  }
}
```

## Development

### ScaffoldKit Project Structure

The source code for **ScaffoldKit** is organized as follows:

```css
scaffoldkit/
├── lib/
│   └── templates/
│       └── src/
│           └── app/
│               └── presentation/
│                   └── main_screen.dart
└── bin/
    └── scaffoldkit.dart
```

## Run Locally

If you want to test the package locally without publishing it, you can clone it and use it directly:

1. Clone this repository:

```bash
git clone https://github.com/tu_usuario/scaffoldkit.git
cd scaffoldkit 
```

2. Add the package to another project locally:

```yaml
dependencies:
  scaffoldkit:
    path: ../path/to/scaffoldkit
```

3. Run the command from your project to generate the structure and dependencies:

```bash
dart run scaffoldkit <project_name> 
```

## Contributions

Contributions are welcome! If you find any issues or have suggestions, feel free to open an issue or
send a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

```go
This version of the `README.md` is now in English, ready for your GitHub repository.
```
