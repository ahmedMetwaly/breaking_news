import "package:breaking_news/generated/l10n.dart";
import "package:dio/dio.dart";

import "../../model/article_model.dart";

class ApiServices {
  static late final Dio _dio;
  static void init() {
    // //print("init");
    _dio = Dio(BaseOptions(
        baseUrl: "https://newsapi.org",
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {"X-Api-Key": "3f6e44e9736949b79a97c733bbf2ed58"}));
    ////print(_dio);
  }

  static Future getInterstedData(
      {required String country, required List<String> interstedTopics}) async {
    try {
      List<ResponseModel> responseModel = [];
      for (int i = 0; i < interstedTopics.length; i++) {
        await _dio.get("/v2/top-headlines", queryParameters: {
          "country": country,
          "category": interstedTopics[i],
        }).then((response) {
          if (response.statusCode == 200) {
            responseModel.add(ResponseModel.fromJson(response.data));
          }
        });
      }
      return responseModel;
    } on DioException catch (error) {
      //print(error);

      if (error.type.name == "connectionTimeout") {
        return S.current.internetNotStable;
      } else if (error.type.name == "connectionError") {
        return S.current.connectionError;
      } else {
        return S.current.unKnownError;
      }
    }
  }

  static Future getTopHeadlineData(
      {required String country, required String specificTopic}) async {
    try {
      ResponseModel responseModel = ResponseModel();
      await _dio.get("/v2/top-headlines", queryParameters: {
        "country": country,
        "category": specificTopic,
      }).then((response) {
        if (response.statusCode == 200) {
          // //print(response.data);
          responseModel = ResponseModel.fromJson(response.data);
          // //print(ResponseModel.fromJson(response.data).totalResult);
        }
      });
      return responseModel;
    } on DioException catch (error) {
      //print(error);

      if (error.type.name == "connectionTimeout") {
        return S.current.internetNotStable;
      } else if (error.type.name == "connectionError") {
        return S.current.connectionError;
      } else {
        return S.current.unKnownError;
      }
    }
  }

  static Future searchOn({required String sentence}) async {
    try {
      ResponseModel responseModel = ResponseModel();
      await _dio.get("/v2/everything", queryParameters: {
        "q": sentence,
        "sortBy": "popularity",
      }).then((response) {
        if (response.statusCode == 200) {
          responseModel = ResponseModel.fromJson(response.data);
          //print(responseModel.totalResult);
          return ResponseModel.fromJson(response.data);
        }
      });
      return responseModel;
    } on DioException catch (error) {
      //print(error);
      if (error.type.name == "connectionTimeout") {
        return S.current.internetNotStable;
      } else if (error.type.name == "connectionError") {
        return S.current.connectionError;
      } else {
        return S.current.unKnownError;
      }
    }
  }
}
