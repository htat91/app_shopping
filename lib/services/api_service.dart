import 'dart:convert';
import 'package:app_shopping/config.dart';
import 'package:app_shopping/model/register_request_model.dart';
import 'package:app_shopping/model/register_response_model.dart';
import 'package:app_shopping/model/user_view_model.dart';
import 'package:app_shopping/services/shared_service.dart';
import 'package:http/http.dart' as http;

import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

class APIService {
  static var client = http.Client();

  // static Future<bool> login(LoginRequestModel model) async {
  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //   };

  //   var url = Uri.https(Config.apiURL, Config.loginAPI);

  //   var response = await client.post(
  //     url, 
  //     headers: requestHeaders, 
  //     body: jsonEncode(model.toJson()),);
  //   if (response.statusCode == 200) {
  //     await SharedService.setLoginDetails(loginResponseJson(response.body));
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  static Future<LoginResponseModel> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url, 
      headers: requestHeaders, 
      body: jsonEncode(model.toJson()),);
    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return loginResponseJson(response.body);
    } else {
      return loginResponseJson(response.body);
    }
  }

  static Future<UserViewModel> getUserProfile() async {

    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.resultObj}'
    };

    var url = Uri.https(Config.apiURL, Config.userProfileAPI + loginDetails.resultObj!);

    var response = await client.get(
      url, 
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      return UserViewModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  static Future<RegisterResponseModel> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(response.body);
  }
}