import 'dart:convert';
import 'dart:typed_data';

import 'package:client/core/helper/configs/instances.dart';
import 'package:http/http.dart' as http;

class FilesUploadApi {
  Future<dynamic> uploadListOfFiles(
      http.MultipartRequest multipartRequest) async {
    try {
      final response =
          await multipartRequest.send().timeout(Duration(seconds: 60));
      Uint8List responseData = await response.stream.toBytes();
      String responseString = String.fromCharCodes(responseData);
      dynamic d = jsonDecode(responseString);
      logger.d(multipartRequest.fields);
      logger.d(response.statusCode);
      logger.d(d);
      if (response.statusCode != 200) return;
      return d;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
