import 'package:flutter_web_portfolio/src/src.dart';
import 'package:http/http.dart' as http;

class ApiConnections {
  Future<bool> createData(VisitorsRequestDataModel data) async {
    final _googleSheetKey =
        'AKfycby31iGQNkbdqKLbs66mpO255RLuKxGJlBzRRnGpXvDYcbsAvWRp7yIY5ohenPJ14XDoPQ';
    final _params = data.toMap().makeQuery();
    final _url =
        'https://script.google.com/macros/s/$_googleSheetKey/exec?$_params';
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
