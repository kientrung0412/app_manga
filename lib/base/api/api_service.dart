import 'package:base_flutter/base/api/app_api_service.dart';
import 'package:base_flutter/model/manga.dart';

abstract class ApiService {
  factory ApiService() => AppApiService();

  Future<List<Manga>> getListMangas();

  Future<Manga> getManga(String url);

  Future<List<Manga>> filterListMangas(Map<String, dynamic> filter);
}
