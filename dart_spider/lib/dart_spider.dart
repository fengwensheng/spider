import 'dart:io';

import 'package:http/http.dart';

class DartSpider {
  final Map<String, String> reqHeader;
  DartSpider({
    required this.reqHeader,
  });

  Future<String> getData({
    required String url,
  }) async {
    final res = await get(
      Uri.parse(url),
      headers: reqHeader,
    );
    if (res.statusCode != HttpStatus.ok) {
      return '<html>Error ${res.statusCode}</html>';
    }
    return res.body;
  }
}
