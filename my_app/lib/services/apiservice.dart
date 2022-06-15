import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
class Binary {
  Future<String> getData(String n) async {
    
    var response = await Dio().get(("https://networkcalc.com/api/binary/$n?from=10&to=2"));

    return response.data["converted"];
    
  }
}
