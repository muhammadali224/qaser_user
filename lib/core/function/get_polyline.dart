import 'dart:convert';

import 'package:http/http.dart' as http;

String? dest;

getDistance({lat1, lon1, lat2, lon2}) async {
  // print(lat1);
  // print(lon1);
  // print(lat2);
  // print(lon2);
  String url =
      // "https://maps.googleapis.com/maps/api/directions/json?origin=$lat1,$lon2&destination=$lat2,$lon2&key=AIzaSyCpZpQ5qZNIeapaqPtFwsC5T7QnO6zfOVc";
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat1,$lon1&destination=$lat2,$lon2&key=AIzaSyCpZpQ5qZNIeapaqPtFwsC5T7QnO6zfOVc";
  var response = await http.post(Uri.parse(url));
  var responseBody = jsonDecode(response.body);
  print(responseBody);

  dest = (responseBody['routes'][0]['legs'][0]['distance']['text']);
  dest = dest!.split(" ").first;
  print("dest is : $dest");

  // var p = 0.017453292519943295;
  // var c = cos;
  // var a = 0.5 -
  //     c((lat2 - lat1) * p) / 2 +
  //     c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  // dest = (12742 * asin(sqrt(a))).toString();
  // print(dest);
  // return 12742 * asin(sqrt(a));
  // print(lat1);
  // print(lon1);
  // print(lat2);
  // print(lon2);
  // var geo = Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  // print(geo);
}
