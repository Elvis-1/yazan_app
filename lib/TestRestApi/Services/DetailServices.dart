import 'dart:convert';
import 'dart:developer';
import 'package:course_flutter/TestRestApi/RestaurantModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailServices {
  static Future<Detail?> getDeatil() async {
    String url = "https://worldwide-restaurants.p.rapidapi.com/detail";
    try {
      var request = http.Request('POST', Uri.parse(url));
      var headers = {
        'content-type': 'application/x-www-form-urlencoded',
        'X-RapidAPI-Key': 'f67d784111msh66f327e1b88682dp1218e1jsna0901743a7c8',
        'X-RapidAPI-Host': 'worldwide-restaurants.p.rapidapi.com',
      };
      request.bodyFields = {
        'currency': 'SAR',
        'language': 'en_US',
        'location_id': '293995'
      };
      request.headers.addAll(headers);
      //print(response.body);
      http.StreamedResponse response = await request.send();
      // print(response.statusCode);
      print(response.statusCode == 200);
      if (response.statusCode == 200) {
        var result = await http.Response.fromStream(response);
        print('here');
        print(jsonDecode(result.body));
        Detail decodedResponse = Detail.fromJson(jsonDecode(result.body));
        return decodedResponse;
      } else {
        print('xxxxxxxxxxxxxxx: ${response.reasonPhrase}');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
