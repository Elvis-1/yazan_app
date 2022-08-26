// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yazan_app/model/type.head.model.dart';
import 'package:yazan_app/model/type.head.model2.dart';

class AppServices {
  static Future<TypeHead2?> getTypeHead() async {
    String url = 'https://worldwide-restaurants.p.rapidapi.com/search';
    try {
      var request = http.Request('POST', Uri.parse(url));
      var headers = {
        // my api key, yours has expired for the day
        // 'content-type': 'application/x-www-form-urlencoded',
        // 'X-RapidAPI-Key': '77d86a473amsh7dca228bf995a99p111a0cjsna6b4d30d79fd',
        // 'X-RapidAPI-Host': 'worldwide-restaurants.p.rapidapi.com'
        'content-type': 'application/x-www-form-urlencoded',
        'X-RapidAPI-Key': 'e78b628e0dmsh2eae0f2ea8ad138p180df3jsnbe5687cc5038',
        'X-RapidAPI-Host': 'worldwide-restaurants.p.rapidapi.com'
      };
      request.bodyFields = {
        "q": "riyadh",
        "language": "en_US",
        "limit": '30',
        "currency": "SAR",
        "location_id": '293995',
      };

      // var response = await http.post(
      //   Uri.parse(url),
      //   headers: {
      //     'content-type': 'application/x-www-form-urlencoded',
      //     'X-RapidAPI-Key':
      //         '77d86a473amsh7dca228bf995a99p111a0cjsna6b4d30d79fd',
      //     'X-RapidAPI-Host': 'worldwide-restaurants.p.rapidapi.com'
      //     // 'content-type': 'application/x-www-form-urlencoded',
      //     // 'X-RapidAPI-Key':
      //     //     'e78b628e0dmsh2eae0f2ea8ad138p180df3jsnbe5687cc5038',
      //     // 'X-RapidAPI-Host': 'worldwide-restaurants.p.rapidapi.com'
      //   },
      //   body: {
      //     "q": "riyadh",
      //     "language": "en_US",
      //     "limit": '1',
      //     "currency": "SAR",
      //     "location_id": '293995',
      //   },
      // );

      request.headers.addAll(headers);
      //print(response.body);
      http.StreamedResponse response = await request.send();
      // print(response.statusCode);
      print(response.statusCode == 200);
      if (response.statusCode == 200) {
        var result = await http.Response.fromStream(response);
        // print(jsonDecode(result.body));
        return TypeHead2.fromJson(jsonDecode(result.body));
      } else {
        print('xxxxxxxxxxxxxxx: ${response.reasonPhrase}');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
