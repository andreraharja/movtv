import 'package:dio/dio.dart';
import 'package:movtv/app/data/data_person_model.dart';
import 'package:movtv/app/data/data_tv_model.dart';
import 'package:movtv/app/data/result_model.dart';
import '../data_movie_model.dart';

class DataProvider {
  Dio _dio = Dio();
  String apiKey = "d532cfe80c8867cffee18984fa1fcc2f";
  String sessionId = "4b5a5b0c44cb87c901ba5f85e0ca159c630ea659";

  Future<List<DataMovie>> getDataMovie(
      {required String topic, String? querySearch}) async {
    try {
      Response response = await _dio
          .get("https://api.themoviedb.org/3/discover/movie?api_key=" + apiKey);
      if (topic.contains("Top")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/movie/top_rated?api_key=" + apiKey);
      } else if (topic.contains("Upcoming")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/movie/upcoming?api_key=" + apiKey);
      } else if (topic.contains("Now")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/movie/now_playing?api_key=" + apiKey);
      } else if (topic.contains("Popular")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/movie/popular?api_key=" + apiKey);
      } else if (topic.contains("Rate")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/account/18457811/rated/movies?api_key=" +
                apiKey +
                "&session_id=" +
                sessionId +
                "&sort_by=created_at.desc");
      } else if (topic.contains("Watchlist")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/account/18457811/watchlist/movies?api_key=" +
                apiKey +
                "&session_id=" +
                sessionId +
                "&sort_by=created_at.desc");
      } else if (topic.contains("Search")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/search/movie?api_key=" +
                apiKey +
                "&query=" +
                querySearch!);
      }
      List<DataMovie> lsResult = [];
      response.data['results']
          .map((i) => lsResult.add(DataMovie.fromJson(i)))
          .toList();
      return lsResult;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<DataTV>> getDataTV(
      {required String topic, String? querySearch}) async {
    try {
      Response response = await _dio
          .get("https://api.themoviedb.org/3/discover/tv?api_key=" + apiKey);
      if (topic.contains("Top")) {
        response = await _dio
            .get("https://api.themoviedb.org/3/tv/top_rated?api_key=" + apiKey);
      } else if (topic.contains("On The Air")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/tv/on_the_air?api_key=" + apiKey);
      } else if (topic.contains("Today")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/tv/airing_today?api_key=" + apiKey);
      } else if (topic.contains("Popular")) {
        response = await _dio
            .get("https://api.themoviedb.org/3/tv/popular?api_key=" + apiKey);
      } else if (topic.contains("Rate")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/account/18457811/rated/tv?api_key=" +
                apiKey +
                "&session_id=" +
                sessionId +
                "&sort_by=created_at.desc");
      } else if (topic.contains("Watchlist")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/account/18457811/watchlist/tv?api_key=" +
                apiKey +
                "&session_id=" +
                sessionId +
                "&sort_by=created_at.desc");
      } else if (topic.contains("Search")) {
        response = await _dio.get(
            "https://api.themoviedb.org/3/search/tv?api_key=" +
                apiKey +
                "&query=" +
                querySearch!);
      }
      List<DataTV> lsResult = [];
      response.data['results']
          .map((i) => lsResult.add(DataTV.fromJson(i)))
          .toList();
      return lsResult;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<DataPerson>> getDataPerson() async {
    try {
      Response response = await _dio
          .get("https://api.themoviedb.org/3/person/popular?api_key=" + apiKey);
      List<DataPerson> lsResult = [];
      response.data['results']
          .map((i) => lsResult.add(DataPerson.fromJson(i)))
          .toList();
      return lsResult;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<Result> submitRateValue(
      String id, String code, double rateValue) async {
    Response response = await _dio.post(
        "https://api.themoviedb.org/3/" +
            code +
            "/" +
            id +
            "/rating?api_key=" +
            apiKey +
            "&session_id=" +
            sessionId,
        data: {"value": rateValue});
    return Result.fromJson(response.data);
  }

  Future<Result> addWatchlist(String id, String code) async {
    Response response = await _dio.post(
        "https://api.themoviedb.org/3/account/18457811/watchlist?api_key=" +
            apiKey +
            "&session_id=" +
            sessionId,
        data: {"media_type": code, "media_id": id, "watchlist": true});
    return Result.fromJson(response.data);
  }
}
