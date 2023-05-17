class DataFrame {
  DataFrame(this._data);

  final Map<String, dynamic> _data;

  Map<String, dynamic> get data => _data;

  List<String> get columns => _data.keys.toList();

  List<dynamic> row(int index) {
    final row = <dynamic>[];
    for (final column in columns) {
      row.add(_data[column][index]);
    }
    return row;
  }

  List<dynamic> operator [](String column) => _data[column];

  DataFrame operator +(DataFrame other) {
    try {
      final result = <String, dynamic>{};
      for (final column in columns) {
        result[column] = <dynamic>[];
        for (var i = 0; i < _data[column].length; i++) {
          result[column].add(_data[column][i] + other[column][i]);
        }
      }
      return DataFrame(result);
    } catch (e) {
      if (e is RangeError) {
        throw Exception('DataFrame columns must be of the same length.');
      } else {
        rethrow;
      }
    }
  }

  DataFrame operator -(DataFrame other) {
    try {
      final result = <String, dynamic>{};
      for (final column in columns) {
        result[column] = <dynamic>[];
        for (var i = 0; i < _data[column].length; i++) {
          result[column].add(_data[column][i] - other[column][i]);
        }
      }
      return DataFrame(result);
    } catch (e) {
      if (e is RangeError) {
        throw Exception('DataFrame columns must be of the same length.');
      } else {
        rethrow;
      }
    }
  }

  (int, int) size() {
    return (_data[columns[0]].length, columns.length);
  }

  @override
  String toString() {
    try {
      final result = <String>[];
      final index = <int>[];
      for (var i = 0; i < _data[columns[0]].length; i++) {
        index.add(i);
      }
      result.add('index\t${columns.join('\t')}');
      for (var i = 0; i < _data[columns[0]].length; i++) {
        result.add('${index[i]}\t${row(i).join('\t')}');
      }
      return result.join('\n');
    } catch (e) {
      if (e is RangeError) {
        throw Exception('DataFrame columns must be of the same length.');
      } else {
        rethrow;
      }
    }
  }
}

extension DataFrameDescription on DataFrame {
  String describe() {
    var result = '';
    for (final column in columns) {
      result += '$column\n';
      result += 'count: ${_data[column].length}\n';
      result += 'mean: ${_mean(_data[column])}\n';
      result += 'std: ${_std(_data[column])}\n';
      result += 'min: ${_min(_data[column])}\n';
      result += '25%: ${_quantile(_data[column], 0.25)}\n';
      result += '50%: ${_quantile(_data[column], 0.5)}\n';
      result += '75%: ${_quantile(_data[column], 0.75)}\n';
      result += 'max: ${_max(_data[column])}\n';
      result += '\n';
    }
    return result;
  }

  List<num> mean() {
    final result = <num>[];
    for (final column in columns) {
      result.add(_mean(_data[column]));
    }
    return result;
  }

  List<num> std() {
    final result = <num>[];
    for (final column in columns) {
      result.add(_std(_data[column]));
    }
    return result;
  }

  List<num> min() {
    final result = <num>[];
    for (final column in columns) {
      result.add(_min(_data[column]));
    }
    return result;
  }

  List<num> max() {
    final result = <num>[];
    for (final column in columns) {
      result.add(_max(_data[column]));
    }
    return result;
  }

  List<num> quantile(num q) {
    final result = <num>[];
    for (final column in columns) {
      result.add(_quantile(_data[column], q));
    }
    return result;
  }

  num _mean(List<num> values) {
    var sum = 0.0;
    for (final value in values) {
      sum += value;
    }
    return sum / values.length;
  }

  num _std(List<num> values) {
    final meanValue = _mean(values);
    var sum = 0.0;
    for (final value in values) {
      sum += (value - meanValue) * (value - meanValue);
    }
    return sum / values.length;
  }

  num _min(List<num> values) {
    var minValue = values[0];
    for (final value in values) {
      if (value < minValue) {
        minValue = value;
      }
    }
    return minValue;
  }

  num _max(List<num> values) {
    var maxValue = values[0];
    for (final value in values) {
      if (value > maxValue) {
        maxValue = value;
      }
    }
    return maxValue;
  }

  num _quantile(List<num> values, num q) {
    final sortedValues = List<num>.from(values);
    sortedValues.sort();
    final index = (sortedValues.length - 1) * q;
    final lower = sortedValues[index.floor()];
    final upper = sortedValues[index.ceil()];
    return lower + (upper - lower) * (index - index.floor());
  }
}
