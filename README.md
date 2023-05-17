# Pandart 0.0.1

The missing Pandas for Dart.

## Features

- Create DataFrame
- Add or Subtract DataFrames
- Use `describe()` to get summary statistics
- More to come...

## Getting started

Install the package by adding the following to your `pubspec.yaml` file:

```yaml
dependencies:
  pandart: ^0.0.1
```

Then import the package in your code:

```dart
import 'package:pandart/pandart.dart';
```

## Usage

```dart
void main() {
  final df1 = DataFrame({
    'a': [1, 2, 3],
    'bass': [4, 5, 6],
    'c': [7, 8, 29],
  });
  print(df1.mean());
}

```
