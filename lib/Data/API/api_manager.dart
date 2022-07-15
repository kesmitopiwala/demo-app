import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:hypnosis/Models/error_model.dart';
import 'package:hypnosis/Models/login_success_response_model.dart';
import 'package:hypnosis/Utils/constant.dart';
import 'package:hypnosis/Utils/custom_widget.dart';

import 'api_exception.dart';

const String jsonContentType = 'application/json';

///
/// This class contain the Comman methods of API
///
class ApiManager {
  ///
  /// Replace base url with this
  ///
  static const String baseUrl = "https://api.techvisionlife.com/";

  ///
  /// This method is used for call API for the `GET` method, need to pass API Url endpoint
  ///
  Future<dynamic> get(String url, {bool isLoaderShow = true}) async {
    Get.printInfo(info: 'Api Get, url $url');
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request
      ///
      Map<String, String> header =
          GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  "authorization": UserData.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .token!,
                };

      Get.printInfo(info: 'header- ${header.toString()}');
      Get.printInfo(info: 'URL- ${baseUrl + url}');

      ///
      /// Make get method api call
      ///
      final response =
          await http.get(Uri.parse(baseUrl + url), headers: header);

      ///
      /// Handle response and errors
      ///
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      Get.printInfo(info: 'No net');
      throw FetchDataException('No Internet connection');
    } finally {
      if (isLoaderShow) {
        EasyLoading.dismiss();
      }
    }
  }

  ///
  /// This method is used for call API for the `POST` method, need to pass API Url endpoint
  ///
  Future<dynamic> post(String url, var parameters,
      {String objcontentType = jsonContentType,
      bool isLoaderShow = true,
      bool isErrorSnackShow = true}) async {
    Get.printInfo(info: 'Api Post, url $url');
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request, if user not loged in then pass emplty array as header
      /// or else pass the authentication token stored on login time
      ///
      Map<String, String> header =
          GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  "authorization": UserData.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .token!,
                  'Content-Type': 'application/json',
                };

      Get.printInfo(info: 'header- ${header.toString()}');
      Get.printInfo(info: 'URL- ${baseUrl + url}');
      Get.printInfo(info: 'BODY PARAMS- $parameters');

      ///
      /// Make the post method api call with header and given parameter
      ///
      final response = await http.post(Uri.parse(baseUrl + url),
          headers: header, body: parameters);
      Get.printInfo(info: response.body);

      ///
      /// Handle response and errors
      ///
      Map<dynamic, dynamic> map =
          _returnResponse(response, isShow: isErrorSnackShow);

      ///
      /// Return the map response here and handle it in you model class accordigly
      ///
      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      CustomWidget.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }

  ///
  /// This method is used for call API for the `PUT` method, need to pass API Url endpoint
  ///
  Future<dynamic> put(String url, var parameters,
      {String objcontentType = jsonContentType,
      bool isLoaderShow = true,
      bool isErrorSnackShow = true}) async {
    Get.printInfo(info: 'Api Post, url $url');
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request, if user not loged in then pass emplty array as header
      /// or else pass the authentication token stored on login time
      ///
      Map<String, String> header =
          GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  "authorization": UserData.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .token!,
                  'Content-Type': 'application/json',
                };

      Get.printInfo(info: 'header- ${header.toString()}');
      Get.printInfo(info: 'URL- ${baseUrl + url}');
      Get.printInfo(info: 'BODY PARAMS- $parameters');

      ///
      /// Make the post method api call with header and given parameter
      ///
      final response = await http.put(Uri.parse(baseUrl + url),
          headers: header, body: json.encode(parameters));
      Get.printInfo(info: response.body);

      ///
      /// Handle response and errors
      ///
      Map<dynamic, dynamic> map =
          _returnResponse(response, isShow: isErrorSnackShow);

      ///
      /// Return the map response here and handle it in you model class accordigly
      ///
      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      CustomWidget.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }

  ///
  /// This method is used for call API for the `DELETE` method, need to pass API Url endpoint
  ///
  Future<dynamic> delete(String url, var parameters,
      {bool isLoaderShow = true, bool isErrorSnackShow = true}) async {
    Get.printInfo(info: 'Api Post, url $url');
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request, if user not loged in then pass emplty array as header
      /// or else pass the authentication token stored on login time
      ///
      Map<String, String> header = {};

      // Map<String, String> header =
      //     GetStorage().read(AppPreferencesHelper.pUser) == null
      //         ? {}
      //         : {
      //             "session": LoginSuccessResponseModel.fromJson(
      //                     GetStorage().read(AppPreferencesHelper.pUser))
      //                 .session!
      //           };
      Get.printInfo(info: 'header- ${header.toString()}');
      Get.printInfo(info: 'URL- ${baseUrl + url}');
      Get.printInfo(info: 'URL- $header');

      ///
      /// Make the post method api call with header and given parameter
      ///
      final response = await http.delete(Uri.parse(baseUrl + url),
          headers: header, body: parameters);
      Get.printInfo(info: response.body);

      ///
      /// Handle response and errors
      ///
      Map<dynamic, dynamic> map =
          _returnResponse(response, isShow: isErrorSnackShow);

      ///
      /// Return the map response here and handle it in you model class accordigly
      ///
      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      CustomWidget.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }

  ///
  /// This method is used to call api with formdata
  ///
  Future<dynamic> postFormData(String url, http.MultipartFile file,
      {String? filePath,
      bool isLoaderShow = true,
      bool isErrorSnackShow = true}) async {
    Get.printInfo(info: 'Api Post, url $url');
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);
      }

      ///
      /// Declare the header for the request, if user not loged in then pass emplty array as header
      /// or else pass the authentication token stored on login time
      ///
      Map<String, String> header =
          GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  "authorization": UserData.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .token!,
                };

      Get.printInfo(info: 'header- ${header.toString()}');
      Get.printInfo(info: 'URL- ${baseUrl + url}');

      ///
      /// Make the post method api call with header and given parameter
      ///
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));
      request.files.add(file);
      request.headers.addAll(header);

      http.StreamedResponse response = await request.send();

      var responseString = await response.stream.bytesToString();
      printInfo(info: responseString);

      ///
      /// Handle response and errors
      ///
      Map<dynamic, dynamic> map = _returnFormDataResponse(
          response.statusCode, json.decode(responseString));

      ///
      /// Return the map response here and handle it in you model class accordigly
      ///
      return map;
    } on SocketException {
      Get.printInfo(info: 'No net');
      CustomWidget.errorSnackBar(content: 'No Internet');
      throw FetchDataException('No Internet connection');
    } finally {
      EasyLoading.dismiss();
    }
  }

  dynamic _returnResponse(http.Response response, {bool isShow = true}) {
    EasyLoading.dismiss();
    print(response.body);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        if (responseJson['status'] == false) {
          throw BadRequestException(responseJson['message']);
        }
        return responseJson;
      case 400:
        if (isShow) {
          CustomWidget.errorSnackBar(content: response.body.toString());
        }
        throw BadRequestException(response.body.toString());
      case 401:
        if (isShow) {
          CustomWidget.errorSnackBar(content: response.body.toString());
        }
        GetStorage().erase();
        // Get.offAllNamed(Routes.loginScreen);

        throw BadRequestException(response.body.toString());
      case 409:
        if (isShow) {
          CustomWidget.errorSnackBar(content: response.body.toString());
        }
        GetStorage().erase();
        // Get.offAllNamed(Routes.loginScreen);

        throw BadRequestException(response.body.toString());
      case 403:
        printInfo(info: json.decode(response.body).message!.toString());
        // Get.offAllNamed(Routes.loginScreen);
        CustomWidget.errorSnackBar(
            content: ErrorModel.fromJson(json.decode(response.body)).message!);

        Get.printInfo(info: "Hello");
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  dynamic _returnFormDataResponse(
      int? statusCode, Map<String, dynamic> response,
      {bool isShow = true}) {
    EasyLoading.dismiss();
    switch (statusCode) {
      case 200:
        var responseJson = response;
        if (responseJson['status'] == false) {
          throw BadRequestException(responseJson['message']);
        }
        return responseJson;
      case 400:
        if (isShow) {
          CustomWidget.errorSnackBar(content: response.toString());
        }
        throw BadRequestException(response.toString());
      case 401:
        if (isShow) {
          CustomWidget.errorSnackBar(content: response.toString());
        }
        GetStorage().erase();
        throw BadRequestException(response.toString());
      case 403:
        CustomWidget.errorSnackBar(
            content: ErrorModel.fromJson(response).message!);
        throw UnauthorisedException(response.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : $statusCode');
    }
  }
}
