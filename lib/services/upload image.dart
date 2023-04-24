// ignore_for_file: non_constant_identifier_names, avoid_print, file_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


dynamic upload_Image(
  String title,
  File file,
) async {
  var request = http.MultipartRequest(
    "POST",
    Uri.parse(
        "http://ec2-18-134-136-249.eu-west-2.compute.amazonaws.com:5000/predict"),
  );
  request.files.add(
    http.MultipartFile.fromBytes("file", File(file.path).readAsBytesSync(),
        filename: file.path),
  );
  final res = await request.send();
  final resStream = await res.stream.bytesToString();
  print(resStream);
  Map valueMap = json.decode(resStream);
  String s = valueMap['result'];
  print(s);
}
