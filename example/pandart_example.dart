import 'package:pandart/pandart.dart';

void main() {
  final df1 = DataFrame({
    'a': [1, 2, 3],
    'bass': [4, 5, 6],
    'c': [7, 8, 29],
  });
  print(df1.mean());
}
