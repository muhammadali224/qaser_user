import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

String? dest;

getDistance({
  required double destinationLatitude,
  required double destinationLongitude,
  required double startLatitude,
  required double startLongitude,
}) async {
  try {
    print("destination Latitude : $destinationLatitude");
    print("destination Longitude : $destinationLongitude");
    print("start Latitude : $startLatitude");
    print("start Longitude : $startLongitude");

    String mapKey = dotenv.env['GMAP_API']!;
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=$startLatitude,$startLongitude&destination=$destinationLatitude,$destinationLongitude&key=$mapKey";

    var response = await http.post(Uri.parse(url));
    var responseBody = jsonDecode(response.body);
    print(responseBody);

    dest = (responseBody['routes'][0]['legs'][0]['distance']['text']);
    dest = dest!.split(" ").first;
    print("dest is : $dest");
  } catch (e) {
    throw Exception("Error Get Route : $e");
  }
}
