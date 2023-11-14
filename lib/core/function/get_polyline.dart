import 'dart:convert';

import 'package:http/http.dart' as http;

String? dest;

getDistance({lat1, lon1, lat2, lon2}) async {
  String url =
      // "https://maps.googleapis.com/maps/api/directions/json?origin=$lat1,$lon2&destination=$lat2,$lon2&key=AIzaSyCpZpQ5qZNIeapaqPtFwsC5T7QnO6zfOVc";
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat1,$lon1&destination=$lat2,$lon2&key=AIzaSyCpZpQ5qZNIeapaqPtFwsC5T7QnO6zfOVc";
  var response = await http.post(Uri.parse(url));
  var responseBody = jsonDecode(response.body);
  print(responseBody);

  dest = (responseBody['routes'][0]['legs'][0]['distance']['text']);
  dest = dest!.split(" ").first;
  print("dest is : $dest");
}
