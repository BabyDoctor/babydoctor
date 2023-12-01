import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Disease {
  final String name;
  final String detail;

  Disease({required this.name, required this.detail});

  factory Disease.fromJson(Map<String, dynamic> json){
    return Disease(name: json['name'], detail: json['detail']);
  }

  static Future<Disease> getDetailByName(String baseUrl, String name) async {
    final response = await http.get(Uri.parse('$baseUrl/disease/?name=$name'));

    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return Disease.fromJson(body[0]);
    }else {
      throw Exception('Failed to load detail');
    }
  }
}

