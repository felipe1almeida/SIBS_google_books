import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/books_model.dart';

class BooksRepository {
  final Dio _dio;

  BooksRepository({required Dio dio}) : _dio = dio;

  Future<BooksModel> getBooksList({required int page, required int max}) async {
    try {
      // final result = await _dio.get('/volumes?q=ios&maxResults=20&startIndex=0');
      final result = await _dio.get(
        '/volumes',
        queryParameters: {
          'startIndex': page,
          'maxResults': max,
          'q': 'ios',
        },
      );

      return BooksModel.fromJson(result.data);
    } on DioError catch (e, s) {
      log('nUnable to get book list', error: e, stackTrace: s);
      throw Exception();
    }
  }

  Future<Items> getVolume({required volumeId}) async {
    try {
      final result = await _dio.get('/volumes/$volumeId');
      return Items.fromJson(result.data);
    } on DioError catch (e, s) {
      log('Unable to get volume', error: e, stackTrace: s);
      throw Exception();
    }
  }
}
