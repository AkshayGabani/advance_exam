

import 'dart:convert';

import 'package:advance_exam/model/jsonData.dart';
import 'package:advance_exam/model/user.dart';
import 'package:advance_exam/utils/ApiString.dart';
import 'package:http/http.dart';

class HttpServices{


  Future<List<User>> postUserApiResponse() async {
    Response response= await post(Uri.parse('${ApiUtils.URL}${ApiUtils.register}'),body: {
      'email': 'eve.holt@reqres.in',
      'password': 'pistol',
    }, );
    print(response.statusCode);
    if(response.statusCode==200)
      {
       final List data=jsonDecode(response.body);
       print(data);
       return data.map((e) => User.fromJson(e)).toList();
      }
    else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<JsonData>> postJsonData() async {
    Response response= await get(Uri.parse(ApiUtils.jsonUrl));
    print(response.statusCode);
    if(response.statusCode==200)
    {
      final List data=jsonDecode(response.body);
      print(data);
      return data.map((e) => JsonData.fromJson(e)).toList();
    }
    else {
      throw "Unable to retrieve posts.";
    }
  }


}