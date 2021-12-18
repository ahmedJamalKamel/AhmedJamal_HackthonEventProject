import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hakathon_redy/Model/user.dart';
import 'package:hakathon_redy/helpers/helpers.dart';
import 'package:hakathon_redy/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

import '../api_settings.dart';

class AuthApiController with Helpers {
  Future<bool> login(BuildContext context,
      {required String mobile, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'password': password,
    });
    if (response.statusCode == 200) {
      //TODO: SHARED PREFERENCES - SAVE LOGGED IN USER DATA!!
      var jsonObject = jsonDecode(response.body)['data'];
      User student = User.fromJson(jsonObject);
      SharedPrefController().save(student: student);
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    return false;
  }
  Future<bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,

    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      // SharedPrefController().clear();
      return true;
    }
    return false;
  }



}
