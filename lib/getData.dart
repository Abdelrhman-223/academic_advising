import 'dart:convert';

import 'package:academic_advising/pages/quality_page.dart';
import 'package:academic_advising/pages/student_page.dart';
import 'package:academic_advising/url_base.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'core/Widgets/toast.dart';

Future loginAPI(context, email, password) async {
  //10.0.2.2:8000 for android emulator
  //127.0.0.1:8000 for ios emulator
  //192.168.16.16 for any device by my ip address
  String urlDomain = "api/auth/login";
  Map<String, dynamic> urlRequest = {"email": email, "password": password};
  var url = Uri.http(UrlBase.urlBase, urlDomain, urlRequest);
  var response = await http.post(url);
  var responseData = jsonDecode(response.body);
  print("--------------------- ${responseData["msg"]}");
  if (responseData["msg"] ==
      "Student login successfully and data have returned") {
    // StudentData.fromJson(responseData);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StudentPage(responseData: responseData),
        ));
  } else if (responseData["msg"] ==
      "Instractor login successfully and data have returned") {
    // StudentData.fromJson(responseData);
    String coursesUrlDomain = "api/courses/all",
        locationsUrlDomain = "api/locations/all",
        schedulesUrlDomain = "api/schedules/all";
    Map<String, dynamic> urlRequest = {
      "token": responseData["data"]["access_token"],
    };
    var coursesUrl = Uri.http(UrlBase.urlBase, coursesUrlDomain, urlRequest);
    var coursesResponse = await http.get(coursesUrl);
    var coursesResponseData = jsonDecode(coursesResponse.body);
    print(jsonDecode(coursesResponse.body));

    var locationsUrl = Uri.http(UrlBase.urlBase, locationsUrlDomain, urlRequest);
    var locationsResponse = await http.get(locationsUrl);
    var locationsResponseData = jsonDecode(locationsResponse.body);
    print(jsonDecode(locationsResponse.body));

    var schedulesUrl = Uri.http(UrlBase.urlBase, schedulesUrlDomain, urlRequest);
    var schedulesResponse = await http.get(schedulesUrl);
    var schedulesResponseData = jsonDecode(schedulesResponse.body);
    print(jsonDecode(schedulesResponse.body));

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QualityPage(
            responseData: responseData,
            coursesResponseData: coursesResponseData,
            locationsResponseData: locationsResponseData,
            schedulesResponseData: schedulesResponseData,
          ),
        ));
  } else {
    myToast(context, responseData["message"].toString());
  }
}
