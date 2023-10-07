import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Country.dart';
 
class Services {
  static const String url = "https://corona.lmao.ninja/v2/countries";
 
  static Future<List<Country>> getCountrys() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Country> list = parseCountrys(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
 
  static List<Country> parseCountrys(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Country>((json) => Country.fromJson(json)).toList();
  }
}