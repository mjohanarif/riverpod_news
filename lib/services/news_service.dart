import 'package:dio/dio.dart';
import 'package:riverpod_news/constants/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsService {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: '${newsAPIBaseURL}apiKey=${dotenv.get('API_KEY')}',
        responseType: ResponseType.json),
  )..interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );

  fetchNews() async {
    var response = await _dio.get('&language=en');

    return (response.data);
  }

  fetchNewsBySearching(String title) async {
    var response = await _dio.get('&language=en&q=$title');

    return response.data;
  }
}
