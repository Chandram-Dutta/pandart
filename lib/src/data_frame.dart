class DataFrame {
  DataFrame(this._data);

  final List<Map<String, dynamic>> _data;

  List<Map<String, dynamic>> get data => _data;

  List<String> get columns => _data.first.keys.toList();

  List<dynamic> column(String name) => _data.map((e) => e[name]).toList();

  List<dynamic> row(int index) => _data[index].values.toList();

  List<dynamic> operator [](int index) => row(index);

  DataFrame operator +(DataFrame other) {
    final data = <Map<String, dynamic>>[];
    for (var i = 0; i < _data.length; i++) {
      data.add({..._data[i], ...other._data[i]});
    }
    return DataFrame(data);
  }

  DataFrame operator -(DataFrame other) {
    final data = <Map<String, dynamic>>[];
    for (var i = 0; i < _data.length; i++) {
      data.add({..._data[i], ...other._data[i]});
    }
    return DataFrame(data);
  }

  DataFrame operator *(DataFrame other) {
    final data = <Map<String, dynamic>>[];
    for (var i = 0; i < _data.length; i++) {
      data.add({..._data[i], ...other._data[i]});
    }
    return DataFrame(data);
  }

  DataFrame operator /(DataFrame other) {
    final data = <Map<String, dynamic>>[];
    for (var i = 0; i < _data.length; i++) {
      data.add({..._data[i], ...other._data[i]});
    }
    return DataFrame(data);
  }

  DataFrame operator %(DataFrame other) {
    final data = <Map<String, dynamic>>[];
    for (var i = 0; i < _data.length; i++) {
      data.add({..._data[i], ...other._data[i]});
    }
    return DataFrame(data);
  }

  DataFrame operator ~/(DataFrame other) {
    final data = <Map<String, dynamic>>[];
    for (var i = 0; i < _data.length; i++) {
      data.add({..._data[i], ...other._data[i]});
    }
    return DataFrame(data);
  }

  DataFrame operator -() {
    final data = <Map<String, dynamic>>[];
    for (var i = 0; i < _data.length; i++) {
      data.add({..._data[i]});
    }
    return DataFrame(data);
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.writeAll(columns, ',');
    buffer.write('\n');
    for (var i = 0; i < _data.length; i++) {
      buffer.writeAll(row(i), ',');
      buffer.write('\n');
    }
    return buffer.toString();
  }
}
