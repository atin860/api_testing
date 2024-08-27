import 'dart:ffi';
import 'dart:math';

import 'package:api_testing/api_dervice/api_service.dart';
import 'package:api_testing/model/single_post_model.dart';
import 'package:flutter/material.dart';

class ApiWithModel extends StatefulWidget {
  const ApiWithModel({super.key});

  @override
  State<ApiWithModel> createState() => _ApiWithModelState();
}

class _ApiWithModelState extends State<ApiWithModel> {


  //////APi Call model ////////////////////////////////////////////////////////////////
  bool isReady = false;
  SinglePostWithModel singlePostWithModel = SinglePostWithModel();
  getSinglePost() {
    isReady = true;
    ApiServices().getListPostWithModel().then((value) {
      setState(() {
        singlePostWithModel =value;
        isReady = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      setState(() {
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    getSinglePost();
    super.initState();
  }
//////////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("APi with model "),
        ),
        body: isReady == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Text(
                    singlePostWithModel.userId.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                        Text(
                    singlePostWithModel.title.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),      Text(
                    singlePostWithModel.userId.toString(),
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ));
  }
}
