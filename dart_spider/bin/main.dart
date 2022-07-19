import 'dart:convert';
import 'dart:io';

import 'package:dart_spider/dart_spider.dart';

void main() => doSpider();

void doSpider() async {
  //read config file
  final Map<String, dynamic> reqOptions = jsonDecode(
    File('request_options.json').readAsStringSync(),
  );
  final reqHeader = reqOptions['reqHeader'].cast<String, String>();
  final baseUrl = reqOptions['baseUrl'];
  //do spider
  final dartSpider = DartSpider(reqHeader: reqHeader);
  final res = await dartSpider.getData(url: baseUrl);
  print(res);
}
