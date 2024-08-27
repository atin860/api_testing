import 'package:api_testing/api_dervice/api_service.dart';
import 'package:api_testing/view/list_post/post_model.dart';
import 'package:flutter/material.dart';

class ListPostModelScreen extends StatefulWidget {
  const ListPostModelScreen({super.key});

  @override
  State<ListPostModelScreen> createState() => _ListPostModelScreenState();
}

class _ListPostModelScreenState extends State<ListPostModelScreen> {
// get post with model function
  // bool isReady = false;
  // List<PostModel> postModel = [];
  // getPOst() {
  //   isReady = true;
  //   ApiServices().getPostWithModel().then(
  //     (value) {
  //       setState(() {
  //         postModel = value!;
  //         isReady = false;
  //       });
  //     },
  //   );
  // }

  // @override
  // void initState() {
  //   getPOst();
  //   // TODO: implement initState
  //   super.initState();
  // }

  ///////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      // body: isReady == true
      //     ? Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //         itemCount: postModel.length,
      //         itemBuilder: (context, index) {
      //           return Card(
      //             margin: EdgeInsets.all(10),
      //             child: ListTile(
      //               leading: Text(postModel[index].id.toString()),
      //               title: Text(postModel[index].title.toString()),
      //               subtitle: Text(postModel[index].body.toString()),
      //             ),
      //           );
      //         },
      //       )

      body: Scaffold(
        appBar: AppBar(
          
          title: Text("get post without model "),
        ),
        body: FutureBuilder(
          future: ApiServices().getPostWithoutModel(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data[index]["title"].toString(),
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(snapshot.data[index]["body"].toString(), style: TextStyle(
                            color: Colors.blue,
                 
                            fontWeight: FontWeight.bold),),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
