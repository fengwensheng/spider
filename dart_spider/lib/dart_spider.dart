import 'dart:io';

import 'package:dart_spider/spider_model.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart';

class DartSpider {
  final Map<String, String> reqHeader;

  DartSpider({
    required this.reqHeader,
  });

  Future<String> _getData({
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

  List<SpiderModel> _parseHtmlStr({
    required String htmlStr,
  }) {
    final doc = Document.html(htmlStr);
    final titles = doc.querySelectorAll(
      'div[class="card-content article"] > h1 > a',
    );
    final contents = doc.querySelectorAll(
      'div.content.more-content',
    );
    //thumbnail could be empty
    final List<Element> thumbnails = [];
    final thumParents = doc.querySelectorAll(
      'div.columns.is-marginless.is-paddingless.is-mobile',
    );

    for (var e in thumParents) {
      thumbnails.add(
        e.querySelector('img') ?? Element.tag('img'),
      );
    }

    final spiderData = List<SpiderModel>.generate(
      titles.length,
      (i) => SpiderModel(
        title: titles[i].text,
        content: contents[i].text,
        thumbnail: thumbnails[i].attributes['src'] ?? '',
      ),
    );

    return spiderData;
  }

  void doSpider({
    required String url,
  }) async {
    final a = _parseHtmlStr(
      htmlStr: await _getData(url: url),
    );
    print(a[0]);
  }
}
