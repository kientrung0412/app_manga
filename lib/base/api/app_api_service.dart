import 'dart:async';

import 'package:base_flutter/base/api/api_service.dart';
import 'package:base_flutter/model/manga.dart';
import 'package:base_flutter/util/url_util.dart';
import 'package:http/http.dart' as http;

class AppApiService with ApiService {
  Future<http.Response> getData(String url) async {
    return http.get(Uri.parse(url)).timeout(Duration(seconds: 15));
  }

  @override
  Future<List<Manga>> getListMangas() async {
    var completer = new Completer<List<Manga>>();

    await getData('http://www.nettruyenvip.com/')
        .then(
          (value) => completer.complete(Manga.fromHtmlToMangas(value.body)),
        )
        .onError(
          (error, stackTrace) => completer.completeError(error!, stackTrace),
        );

    return completer.future;
  }

  @override
  Future<Manga> getManga(String url) async {
    var completer = new Completer<Manga>();

    await getData(url)
        .then(
          (value) => completer.complete(Manga.fromHtmlToManga(value.body)),
        )
        .onError(
          (error, stackTrace) => completer.completeError(error!, stackTrace),
        );

    return completer.future;
  }

  @override
  Future<List<Manga>> filterListMangas(Map<String, dynamic> filter) async {
    var completer = new Completer<List<Manga>>();
    var url =
        'http://www.nettruyenvip.com/tim-truyen-nang-cao/${UrlUtil.mapToParameter(filter)}';

    await getData(url)
        .then(
          (value) => completer.complete([]),
        )
        .onError(
          (error, stackTrace) => completer.completeError(error!, stackTrace),
        );
    return completer.future;
  }
}
