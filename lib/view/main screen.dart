// import 'package:api_testing/view/api_screen/api_with_model_Screen.dart';
// import 'package:api_testing/view/api_screen/api_without_model.dart';
// import 'package:api_testing/view/list_post/list_post_modelscreen.dart';
// import 'package:api_testing/view/mix_data_api/multi_data_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MainScreenNavigator extends StatefulWidget {
//   const MainScreenNavigator({super.key});

//   @override
//   State<MainScreenNavigator> createState() => _MainScreenNavigatorState();
// }

// class _MainScreenNavigatorState extends State<MainScreenNavigator> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("APi implementation"),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   Get.to(ApiWithModel());
//                 },
//                 child: Text("single api with model")),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   Get.to(ApiWithoutModel());
//                 },
//                 child: Text("single api without model")),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   Get.to(ListPostModelScreen());
//                 },
//                 child: Text("List api with model")),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   Get.to(MultiDataScreen());
//                 },
//                 child: Text("List api with model")),
//           ],
//         ),
//       ),
//     );
//   }
// }
