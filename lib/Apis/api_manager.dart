import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/APIs/api_constants.dart';
import 'package:news_app/APIs/endpoints.dart';
import 'package:news_app/model/SourceResponse.dart';
class ApiManager {
  static Future<SourceResponse?> getSources() async {
    try {
      Uri url = Uri.https(
        ApiConstants.baseUrl,
        EndPoints.sourceApi,
        {'apiKey': ApiConstants.apiKey},
      );

      var response = await http.get(url);
      print("API Response Code: ${response.statusCode}");
      print("API Raw Response: ${response.body}");

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return SourceResponse.fromJson(json);
      } else {
        print("Error: ${response.statusCode}, ${response.body}");
        return SourceResponse(
          status: "error",
          message: "Failed to fetch data",
        );
      }
    } catch (e) {
      print("API Exception: $e");
      return SourceResponse(
        status: "error",
        message: "Something went wrong",
      ); //
    }
  }
  static Future<Map<String, dynamic>> getNews(String sourceId) async {
    final Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi,
        {
          'apiKey':ApiConstants.apiKey,
          'sources':sourceId
        });

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load news");
      }
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }
}