import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movie_application/Config/config.dart';

Future<dynamic> getAPI(myurl) async {
  final url = base_url + myurl;
  print('this is url $url');
  try {
    print("Here");
    final response = await http.get(
      Uri.parse('$url'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    print("this is response of Api call ${json.decode(response.body)}");
    if (response.statusCode == 200) {
      print("${response.statusCode}");
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  } catch (e) {
    Map<String, dynamic> response = {
      "status": 400,
      "message": "No Internet Connection"
    };
    return response;
  }
}
