import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/motive.dart';
import 'package:motivapp/view/widgets/mood_widget.dart';
import 'package:motivapp/view_model/motive_vm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text(""),
        //   actions: [
        //     InkWell(
        //       child: const SizedBox(
        //         width: 50,
        //       ),
        //       onDoubleTap: () {
        //         Get.to(() => const AdminLoginPage());
        //       },
        //     ),
        //     IconButton(
        //         onPressed: () => Get.find<MotiveVM>().getLangs(), icon: const Icon(Icons.language))
        //   ],
        // ),
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetBuilder<MotiveVM>(
        initState: (_) async {
          Get.put(MotiveVM());
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Get.find<MotiveVM>().name.value = prefs.getString("name") ?? "";
        },
        builder: (logic) {
          return Obx(() {
            return StreamBuilder<QuerySnapshot<Motive>>(
              stream: FirebaseFirestore.instance
                  .collection('motives')
                  .where("local", isEqualTo: logic.local.value)
                  // .orderBy("order")
                  .withConverter<Motive>(
                    fromFirestore: (snapshots, _) => Motive.fromJson(snapshots.data()!),
                    toFirestore: (motive, _) => motive.toJson(),
                  )
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.requireData.docs;
                  return MoodWidget(data: data);
                } else {
                  return Container();
                }
              },
            );
          });
        },
      ),
    ));
  }
}
