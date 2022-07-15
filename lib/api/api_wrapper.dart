import 'dart:convert';

import 'package:animation_demo/api/response_wrapper.dart';
import 'package:animation_demo/model/add_professor_data_model.dart';
import 'package:animation_demo/model/get_professor_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../utils/log_utils.dart';

class ApiWrapper {
  static String baseUrl = "http://192.168.1.16:8000/api/device/";

  static Dio? dio;

  static final LogInterceptor _logInterceptor = LogInterceptor(responseBody: true, requestHeader: true, responseHeader: true, request: true, error: true, requestBody: true, logPrint: (obj) => Log.info(obj is Map ? jsonEncode(obj) : obj.toString()));

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        contentType: Headers.jsonContentType,
      ),
    );
    dio!.interceptors.add(
      DioCacheManager(
        CacheConfig(baseUrl: baseUrl),
      ).interceptor,
    );
    dio!.interceptors.add(_logInterceptor);
    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          String token = "My Token";
          request.headers['Authorization'] = 'Bearer $token';
          return handler.next(request);
        },
        onError: (e, handler) async {
          handler.next(e);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
      ),
    );
  }

  static Future<ResponseWrapper> _getRequest({required String endPoint}) async {
    ResponseWrapper responseWrapper = ResponseWrapper(response: null, message: null, isSuccess: false);

    try {
      Response response = await dio!.get(
        endPoint,
        // options: buildCacheOptions(
        //   Duration(days: 1),
        // ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        responseWrapper = ResponseWrapper(response: response, message: "SUCCESSFULL", isSuccess: true);
      } else if (response.statusCode == 400) {
        responseWrapper = ResponseWrapper(response: null, message: "BAD REQUEST", isSuccess: false);
      } else if (response.statusCode == 401) {
        responseWrapper = ResponseWrapper(response: null, message: "UNAUTHORISE", isSuccess: false);
      } else if (response.statusCode == 404) {
        responseWrapper = ResponseWrapper(response: null, message: "NOT FOUND", isSuccess: false);
      } else if (response.statusCode == 403) {
        responseWrapper = ResponseWrapper(response: null, message: "FORBIDEN", isSuccess: false);
      } else {
        responseWrapper = ResponseWrapper(response: null, message: "REQUEST GOT FAILED DUE TO : ${response.statusCode}", isSuccess: false);
      }
      return responseWrapper;
    } on DioError catch (e) {
      String message = "";
      switch (e.type) {
        case DioErrorType.connectTimeout:
          message = "CONNECTION TIMEOUT";
          print(message);
          break;
        case DioErrorType.receiveTimeout:
          message = "RECEIVE TIMEOUT";
          print(message);
          break;
        case DioErrorType.sendTimeout:
          message = "SEND TIMEOUT";
          print(message);
          break;
        case DioErrorType.other:
          message = "OTHER DIO ERROR";
          print(message);
          break;
      }
      responseWrapper = ResponseWrapper(response: null, message: message, isSuccess: false);
      return responseWrapper;
    } catch (e) {
      String message = 'error : ${e.toString()}';
      print(message);
      responseWrapper = ResponseWrapper(response: null, message: message, isSuccess: false);
      return responseWrapper;
    }
  }

  static Future<ResponseWrapper> _postRequest({required String endPoint, required Map<String, dynamic> data}) async {
    ResponseWrapper responseWrapper = ResponseWrapper(response: null, message: null, isSuccess: false);

    try {
      Response response = await dio!.post(
        endPoint,
        // options: buildCacheOptions(
        //   Duration(days: 1),
        // ),
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        responseWrapper = ResponseWrapper(response: response, message: "SUCCESSFULL", isSuccess: true);
      } else if (response.statusCode == 400) {
        responseWrapper = ResponseWrapper(response: null, message: "BAD REQUEST", isSuccess: false);
      } else if (response.statusCode == 401) {
        responseWrapper = ResponseWrapper(response: null, message: "UNAUTHORISE", isSuccess: false);
      } else if (response.statusCode == 404) {
        responseWrapper = ResponseWrapper(response: null, message: "NOT FOUND", isSuccess: false);
      } else if (response.statusCode == 403) {
        responseWrapper = ResponseWrapper(response: null, message: "FORBIDEN", isSuccess: false);
      } else {
        responseWrapper = ResponseWrapper(response: null, message: "REQUEST GOT FAILED DUE TO : ${response.statusCode}", isSuccess: false);
      }
      return responseWrapper;
    } on DioError catch (e) {
      String message = "";
      switch (e.type) {
        case DioErrorType.connectTimeout:
          message = "CONNECTION TIMEOUT";
          print(message);
          break;
        case DioErrorType.receiveTimeout:
          message = "RECEIVE TIMEOUT";
          print(message);
          break;
        case DioErrorType.sendTimeout:
          message = "SEND TIMEOUT";
          print(message);
          break;
        case DioErrorType.other:
          message = "OTHER DIO ERROR";
          print(message);
          break;
      }
      responseWrapper = ResponseWrapper(response: null, message: message, isSuccess: false);
      return responseWrapper;
    } catch (e) {
      String message = 'error : ${e.toString()}';
      print(message);
      responseWrapper = ResponseWrapper(response: null, message: message, isSuccess: false);
      return responseWrapper;
    }
  }

  static Future<ResponseWrapper> _putRequest({required String endPoint, required Map<String, dynamic> data}) async {
    ResponseWrapper responseWrapper = ResponseWrapper(response: null, message: null, isSuccess: false);

    try {
      Response response = await dio!.put(endPoint,
          options: buildCacheOptions(
            Duration(
              days: 1,
            ),
          ),
          data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        responseWrapper = ResponseWrapper(response: response, message: "SUCCESSFULL", isSuccess: true);
      } else if (response.statusCode == 400) {
        responseWrapper = ResponseWrapper(response: null, message: "BAD REQUEST", isSuccess: false);
      } else if (response.statusCode == 401) {
        responseWrapper = ResponseWrapper(response: null, message: "UNAUTHORISE", isSuccess: false);
      } else if (response.statusCode == 404) {
        responseWrapper = ResponseWrapper(response: null, message: "NOT FOUND", isSuccess: false);
      } else if (response.statusCode == 403) {
        responseWrapper = ResponseWrapper(response: null, message: "FORBIDDEN", isSuccess: false);
      } else {
        responseWrapper = ResponseWrapper(response: null, message: "REQUEST GOT FAILED DUE TO : ${response.statusCode}", isSuccess: false);
      }
      return responseWrapper;
    } on DioError catch (e) {
      String message = "";
      switch (e.type) {
        case DioErrorType.connectTimeout:
          message = "CONNECTION TIMEOUT";
          break;
        case DioErrorType.receiveTimeout:
          message = "RECEIVE TIMEOUT";
          break;
        case DioErrorType.sendTimeout:
          message = "SENDING TIMEOUT";
          break;
        case DioErrorType.other:
          message = "OTHER DIO ERROR";
          break;
      }
      responseWrapper = ResponseWrapper(response: null, message: message, isSuccess: false);
      return responseWrapper;
    } catch (e) {
      String message = 'error : ${e.toString()}';
      print(message);
      responseWrapper = ResponseWrapper(response: null, message: message, isSuccess: false);
      return responseWrapper;
    }
  }

  static Future<ResponseWrapper> _deleteRequest({required String endPoint}) async {
    ResponseWrapper responseWrapper = ResponseWrapper(response: null, message: null, isSuccess: false);
    try {
      Response response = await dio!.delete(
        endPoint,
        options: buildCacheOptions(
          Duration(
            days: 1,
          ),
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        responseWrapper = ResponseWrapper(response: response, message: "SUCCESSFULL", isSuccess: true);
      } else if (response.statusCode == 400) {
        responseWrapper = ResponseWrapper(response: null, message: "BAD REQUEST", isSuccess: false);
      } else if (response.statusCode == 401) {
        responseWrapper = ResponseWrapper(response: null, message: "UNAUTHORISE", isSuccess: false);
      } else if (response.statusCode == 404) {
        responseWrapper = ResponseWrapper(response: null, message: "NOT FOUND", isSuccess: false);
      } else if (response.statusCode == 403) {
        responseWrapper = ResponseWrapper(response: null, message: "FORBIDDEN", isSuccess: false);
      } else {
        responseWrapper = ResponseWrapper(response: null, message: "REQUEST GOT FAILED DUE TO : ${response.statusCode}", isSuccess: false);
      }
      return responseWrapper;
    } on DioError catch(e){
      String message = "";
      switch (e.type){
        case DioErrorType.connectTimeout:
          message = "CONNECTION TIMEOUT";
          break;
        case DioErrorType.receiveTimeout:
          message = "RECEIVE TIMEOUT";
          break;
        case DioErrorType.sendTimeout:
          message = "SEND TIMEOUT";
          break;
        case DioErrorType.other:
          message = "DIO OTHER ERROR";
          break;
      }
      responseWrapper = ResponseWrapper(response: null, message: message, isSuccess: false);
      return responseWrapper;
    } catch (e) {
      String message = 'error : ${e.toString()}';
      print(message);
      responseWrapper = ResponseWrapper(response: null, message: message, isSuccess: false);
      return responseWrapper;
    }
  }

  static Future<bool> addProfessorPostData(AddProfessorModel addProfessorModel) async {
    String endPoint = "professors";
    ResponseWrapper responseWrapper = await _postRequest(endPoint: endPoint, data: addProfessorModel.toJson()).then((value) {
      return value;
    });
    return responseWrapper.isSuccess;
  }

  static Future<bool> deleteProfessorData(int id) async {
    String endPoint = "professors/$id";
    ResponseWrapper responseWrapper = await _deleteRequest(endPoint: endPoint).then((value) {
      return value;
    });
    return responseWrapper.isSuccess;;
  }

  static Future<GetProfessor?> getProfessorsList() async {
    String endPoint = "professors";
    ResponseWrapper responseWrapper = await _getRequest(endPoint: endPoint);
    if(responseWrapper.isSuccess){
      return GetProfessor.fromJson(responseWrapper.response!.data);
    }else {
      return null;
    }
  }

}
