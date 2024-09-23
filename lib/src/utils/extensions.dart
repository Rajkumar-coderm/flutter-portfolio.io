extension ApiMapExtenstion on Map<String, dynamic> {
  Map<String, dynamic> removeNullValues() {
    var result = <String, dynamic>{};

    forEach(
      (key, value) {
        if (value != null) {
          if (value is Map) {
            if (value.isEmpty) return;
            if (value is Map<String, dynamic>) {
              result[key] = value.removeNullValues();
            } else {
              return;
            }
          } else if (value is List) {
            if (value.isEmpty) return;
            var data = value
                .where((element) =>
                    element != null &&
                    ((element is String || element is List || element is Map)
                        ? element.isNotEmpty
                        : true))
                .map((element) {
              if (element is Map) {
                if (element.isEmpty) return;
                if (element is Map<String, dynamic>) {
                  return element.removeNullValues();
                }
              } else if (element is String && element.trim().isEmpty) {
                return element;
              }
              return element;
            }).toList();
            if (data.isEmpty) return;
            result[key] = data;
          } else if (value is String && value.trim().isNotEmpty) {
            result[key] = value;
          } else if (value is! String) {
            result[key] = value;
          }
        }
      },
    );
    return result;
  }

  String makeQuery() {
    var res = [];
    for (var entry in removeNullValues().entries) {
      var key = entry.key;
      var value = entry.value;
      res.add('$key=$value');
    }
    return res.join('&');
  }
}
