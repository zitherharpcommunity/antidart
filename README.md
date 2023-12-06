<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# Antidart :no_entry_sign:

## Introduction

You don't want to use `Dart` in itself?

You want to use an another language in `Dart`?

This _package_ is generated for you!

## Support languages

- `Kotlin`
- `Java` (planning)
- `C#` (planning)
- `Swift` (planning)

> [!NOTE] 
> All planning languages are tentative and can be changed in the future.

## Getting started

- Run this command to add `antidart` package into your project.

```sh
dart pub run antidart
```
- Then let's import a single language that you want to use like this.

```dart
import 'package:antidart/<support_language>.dart';
```

> [!TIP] 
> To avoid conflicts between libraries, please _**only**_ import a single language that you want to use.

## Usage

- Kotlin:

```dart
import 'package:antidart/kotlin.dart';

fun main(vararg<String> args) {
  val awesome = 'Awesome!';
  println('awesome: ${awesome}');
}
```

- See more longer examples in `/example` folder. 

## Additional information

- To contribute to this project, you can open an issue at [here](https://github.com/lehoangbaochung/antidart/issues).
