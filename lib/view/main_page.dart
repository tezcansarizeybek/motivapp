import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/view_model/motive_vm.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MotiveVM());
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
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.red.shade200, Colors.pinkAccent.shade100])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Text("D'mottie",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Icon(Icons.star),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text("Merhaba\nBen Mottie\nSenin adın ne?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 18, right: Get.size.width / 4, left: Get.size.width / 4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                          fillColor: Colors.white24,
                          filled: true,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, color: Colors.white, decoration: TextDecoration.none),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    )
        // GetBuilder<MotiveVM>(
        //   initState: (_) async {
        //     Get.put(MotiveVM());
        //   },
        //   builder: (logic) {
        //     return Obx(() {
        //       return StreamBuilder<QuerySnapshot<Motive>>(
        //           stream: FirebaseFirestore.instance
        //               .collection('motives')
        //               .where("local", isEqualTo: logic.local.value)
        //               .withConverter<Motive>(
        //                 fromFirestore: (snapshots, _) => Motive.fromJson(snapshots.data()!),
        //                 toFirestore: (motive, _) => motive.toJson(),
        //               )
        //               .snapshots(),
        //           builder: (context, snapshot) {
        //             if (snapshot.hasData) {
        //               final doc = snapshot.requireData;
        //               return GridView.builder(
        //                 gridDelegate:
        //                     const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 131),
        //                 itemBuilder: (context, index) {
        //                   var data = doc.docs[index].data();
        //                   return Container(
        //                     padding: const EdgeInsets.all(8),
        //                     child: InkWell(
        //                       onTap: () async {
        //                         await logic.getCommentByMotive(data.category ?? "");
        //                         if (logic.comment.value.comment != null) {
        //                           Get.to(() => const CommentPage());
        //                         }
        //                       },
        //                       child: Stack(
        //                         children: [
        //                           Image.network(data.icon ?? ""),
        //                           Positioned(
        //                             child: Text("${data.category}", textAlign: TextAlign.center),
        //                             bottom: 0,
        //                             left: 0,
        //                             right: 0,
        //                           )
        //                         ],
        //                       ),
        //                     ),
        //                   );
        //                 },
        //                 itemCount: doc.size,
        //               );
        //             } else {
        //               return Container();
        //             }
        //           });
        //     });
        //   },
        // ),
        );
  }
}
