import 'dart:convert';
import 'dart:developer';

import 'package:application_design_demo/datamodel/dio_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiCallDioRepository {
  Dio dio = Dio();

  Future<List<DioModel>> getApiList() async {
    List<DioModel> posts = [];

    try {
     Response response = await dio.get("https://jsonplaceholder.typicode.com/posts");
       // http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      if (response.statusCode == 200) {
        // for (var element in response.data) {
        //   posts.add(DioModel.fromJson(element));
        // }
        //
        // log("posts ${posts.length} postsData: ${posts}");
        // return posts;
        // print('-----------${response.body.toString()}');
        // List<DioModel> _post = ;

        // Https
        // return (jsonDecode(response.body) as List).map((item) => DioModel.fromJson(item)).toList();

        // Dio
        return (response.data as List).map((item) => DioModel.fromJson(item)).toList();

           // Dio using from json
           // var getUsersData = response.data as List;
           // var listUsers = getUsersData.map((i) => DioModel.fromJson(i)).toList();
           // return listUsers;
      } else {
        throw "Unable to retrieve posts.";
      }
    } catch (e) {
      throw e;
    }
  }
}
