import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/motive.dart';
import 'package:motivapp/view/admin_page.dart';
import 'package:motivapp/view/comment_page.dart';
import 'package:motivapp/view_model/motive_vm.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MotiveVM());
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        actions: [
          InkWell(
            child: SizedBox(
              width: 50,
            ),
            onDoubleTap: () {
              Get.to(() => const AdminPage());
            },
          )
        ],
      ),
      body: GetBuilder<MotiveVM>(
        initState: (_) async {
          Get.put(MotiveVM());
        },
        builder: (logic) {
          return StreamBuilder<QuerySnapshot<Motive>>(
              stream: logic.motivesRef.orderBy("order").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final doc = snapshot.requireData;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 131),
                    itemBuilder: (context, index) {
                      var data = doc.docs[index].data();
                      return Container(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () async {
                            await logic.getCommentByMotive(data.category ?? "");
                            if (logic.comment.value.comment != null) {
                              Get.to(() => const CommentPage());
                            }
                          },
                          child: Stack(
                            children: [
                              Image.network(data.icon ?? ""),
                              Positioned(
                                child: Text("${data.category}", textAlign: TextAlign.center),
                                bottom: 0,
                                left: 0,
                                right: 0,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: doc.size,
                  );
                } else {
                  return Container();
                }
              });
        },
      ),
    );
  }
}
