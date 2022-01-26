import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:faustyna/constants/constants.dart';
import 'package:faustyna/models/menu_data_model.dart';
import 'package:faustyna/models/news_model.dart';
import 'package:get/get.dart';

class RestApi extends GetxController {
  late Dio httpClient;

  @override
  onInit() async {
    httpClient = Dio();
    httpClient.options.sendTimeout = 30 * 1000;
    httpClient.options.connectTimeout = 30 * 1000;
    httpClient.options.receiveTimeout = 30 * 1000;
    super.onInit();
  }

  String get restApiUrl {
    return REST_API_URL;
  }

  Future<MenuDataModel?> getMenuData() async {
    try {
      final url = '$restApiUrl/api/menu';
      print(url);
      final response = await httpClient.get(url);
      print(response.statusCode);
      print(response.data);
      return MenuDataModel.fromJson(response.data);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return null;
    }
  }

  Future<List<NewsModel>?> getNews() async {
    try {
      final url = '$restApiUrl/api/news';
      print(url);
      final response = await httpClient.get(url);
      print(response.statusCode);
      print(response.data);
      return response.data
          .map<NewsModel>((e) => NewsModel.fromJson(e))
          .toList();
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return null;
    }
  }

  Future<String> getPage(String pageId)  async {
    try {
      final url = '$restApiUrl/api/page/$pageId';
      print(url);
      final response = await httpClient.get(url);
      print(response.statusCode);
      print(response.data);
      return response.data['content'];
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      return "";
    }
  }

}