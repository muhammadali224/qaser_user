import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

String? dest;

getDistance({lat1, lon1, lat2, lon2}) async {
  String mapKey = dotenv.env['GMAP_API']!;
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat1,$lon1&destination=$lat2,$lon2&key=$mapKey";
  var response = await http.post(Uri.parse(url));
  var responseBody = jsonDecode(response.body);
  print(responseBody);

  dest = (responseBody['routes'][0]['legs'][0]['distance']['text']);
  dest = dest!.split(" ").first;
  print("dest is : $dest");
}
