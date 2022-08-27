import 'dart:convert';
import 'dart:developer';
import 'package:course_flutter/TestRestApi/RestaurantModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ReviewServices{
  static Future<Review?> getReviews() async {
    String url = "https://worldwide-restaurants.p.rapidapi.com/reviews";
    try {
      var request = http.Request('POST', Uri.parse(url));
      var headers = {
        'content-type': 'application/x-www-form-urlencoded',
        'X-RapidAPI-Key': '4f5d83c493msh3c95222ef584b53p14cb5djsn570c81e2071d',
        'X-RapidAPI-Host': 'worldwide-restaurants.p.rapidapi.com',
      };
      request.bodyFields = {
        'currency': 'SAR',
        'language': 'en_US',
        'location_id': '293995' ,
        'limit' : '15' ,
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
        Review decodedResponse = Review.fromJson(jsonDecode(result.body));
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