import 'dart:convert';

import 'package:api_testing/model/single_post_model.dart';
import 'package:api_testing/view/list_post/post_model.dart';
import 'package:api_testing/view/mix_data_api/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  /////single post  with model
  Future<SinglePostWithModel?> getSinglePostWithModel() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        SinglePostWithModel model =
            SinglePostWithModel.fromJson(json.decode(response.body));
        return model;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("single post with model error: $e");
    }
    return null;
  }

/////single post without model
  Future<dynamic> getSinglePostWithoutModel() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final body = response.body;
        final data = jsonDecode(body);
        return data;
      } else {}
    } catch (e) {
      print(" single post without model error: $e");
    }
    return null;
  }
////////////////// list Post with  MOdel

  Future<List<PostModel>?> getPostWithModel() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      if (response.statusCode == 200) {
        List<PostModel> model = List<PostModel>.from(
            json.decode(response.body).map((x) => PostModel.fromJson(x)));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }



  ////////////////// list Post without MOdel

  Future<dynamic> getPostWithoutModel() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      if (response.statusCode == 200) {
       final model =jsonDecode(response.body);
       return model;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }



  ////mix model 
   Future<multiData?> getMultiDataWithOutModel()async{
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

      if (response.statusCode==200) {
        multiData model = multiData.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
      
    }
    return null;
   }

  getListPostWithModel() {}

}

