import 'package:api_testing/api_dervice/api_service.dart';
import 'package:flutter/material.dart';

class ApiWithoutModel extends StatefulWidget {
  const ApiWithoutModel({super.key});

  @override
  State<ApiWithoutModel> createState() => _ApiWithoutModelState();
}

class _ApiWithoutModelState extends State<ApiWithoutModel> {
  dynamic singlePost;
  bool isReady = false;
  SinglePostWithModel() {
    isReady = true;
    ApiServices().getSinglePostWithoutModel().then((value) {
      setState(() {
        singlePost = value;
        isReady = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      isReady = false;
    });
  }

  @override
  void initState() {
    SinglePostWithModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Api Without Model"),
        ),
        body: isReady == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Text(
                    singlePost["title"].toString(),
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    singlePost["body"].toString(),
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    singlePost["userId"].toString(),
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ));
  }
}
