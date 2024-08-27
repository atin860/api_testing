import 'package:api_testing/api_dervice/api_service.dart';
import 'package:api_testing/view/mix_data_api/model.dart';
import 'package:flutter/material.dart';

class MultiDataScreen extends StatefulWidget {
  const MultiDataScreen({super.key});

  @override
  State<MultiDataScreen> createState() => _MultiDataScreenState();
}

class _MultiDataScreenState extends State<MultiDataScreen> {
  bool isReady = false;
  multiData mixdata = multiData();
  getMultiData() {
    isReady = true;
    ApiServices().getMultiDataWithOutModel().then((value) {
      setState(() {
        mixdata = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    getMultiData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isReady == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mixdata.page.toString(),
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
                Text(
                  mixdata.perPage.toString(),
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
                Text(
                  mixdata.total.toString(),
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
                Text(
                  mixdata.totalPages.toString(),
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
                Text(
                  mixdata.support!.text.toString(),
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: mixdata.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(mixdata.data![index].firstName.toString()),
                        subtitle:
                            Text(mixdata.data![index].firstName.toString()),
                      ),
                    );
                  },
                ))
              ],
            ),
    );
  }
}
