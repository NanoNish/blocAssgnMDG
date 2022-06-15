import 'package:http/http.dart' as http;
import 'dart:convert';

class Binary {
  Future<String> getData(String n) async {
    var url = Uri.parse("https://networkcalc.com/api/binary/$n?from=10&to=2");
    var response = await http.get(url);

    Map data = jsonDecode(response.body);
    String finalData = data['converted'];
    print(finalData);
    return finalData;
  }
}
