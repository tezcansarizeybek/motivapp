import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/view_model/motive_vm.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: Get.size.width,
                    maxHeight: Get.size.height / 3,
                  ),
                  child: Center(
                    child: Obx(() {
                      return Text("${Get.find<MotiveVM>().comment.value.comment}",
                          textAlign: TextAlign.center);
                    }),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      Get.back();
                    },
                    child: const Text("Geri")),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      await Get.find<MotiveVM>()
                          .getCommentByMotive(Get.find<MotiveVM>().comment.value.motive ?? "");
                    },
                    child: const Text("Yeni")),
              )
            ],
          )
        ],
      ),
    );
  }
}
