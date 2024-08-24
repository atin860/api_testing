import 'package:api_testing/api_dervice/api_service.dart';
import 'package:api_testing/model/post_model.dart';
import 'package:flutter/material.dart';

class PostModelScreen extends StatefulWidget {
  const PostModelScreen({super.key});

  @override
  State<PostModelScreen> createState() => _PostModelScreenState();
}

class _PostModelScreenState extends State<PostModelScreen> {
  bool isReady = false;
  List<PostModel> postModel = [];
  _getPost() {
    isReady = true;
    ApiServices().getPostWithModel().then((value) {
      setState(() {
        postModel = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post MOdel ui"),
      ),
      body: isReady == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: postModel.length,
              itemBuilder: ((context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Text(postModel[index].id.toString()),
                    title: Text(postModel[index].title.toString()),
                    subtitle: Text(postModel[index].body.toString()),
                  ),
                );
              })),
    );
  }
}
