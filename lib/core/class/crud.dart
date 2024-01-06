import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../function/check_internet.dart';
import 'status_request.dart';

String _basicAuth =
    'Basic ${base64Encode(utf8.encode('muhammad:muhammad224'))}';

Map<String, String> myHeader = {
  'authorization': _basicAuth,
};

class CRUD {
  Future<Either<StatusRequest, Map>> postData(
      String url, Map<String, dynamic> data) async {
    try {
      try {
        if (await checkInternet()) {
          var response = await http.post(Uri.parse(url), body: data);
          if (response.statusCode == 200 || response.statusCode == 201) {
            var responseBody = jsonDecode(response.body);
            // ignore: avoid_print
            print(responseBody);
            return right(responseBody);
          } else {
            return left(StatusRequest.serverFail);
          }
        } else {
          return left(StatusRequest.offline);
        }
      } catch (e) {
        return left(StatusRequest.serverException);
      }
    } catch (e) {
      throw Exception("Error CRUD $e");
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImage(
      String url, Map data, File? image) async {
    try {
      var uri = Uri.parse(url);
      var request = http.MultipartRequest("POST", uri);

      var length = await image!.length();

      var multipartFile = http.MultipartFile(
        "file",
        http.ByteStream(image.openRead()),
        length,
        filename: basename(image.path),
      );
      request.headers.addAll(myHeader);
      request.files.add(multipartFile);

      // add Data to request
      data.forEach((key, value) {
        request.fields[key] = value;
      });
      // add Data to request

      // Send Request
      var myRequest = await request.send();
      // For get Response Body

      var response = await http.Response.fromStream(myRequest);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        var responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverFail);
      }
    } catch (_) {
      return left(StatusRequest.serverException);
    }
  }
}
