import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/controller_models/comment_controller_model.dart';
import 'package:motivapp/view_model/admin_vm.dart';

class CommentFormWidget extends StatelessWidget {
  const CommentFormWidget({
    Key? key,
    required this.commentControllerModel,
  }) : super(key: key);

  final CommentControllerModel commentControllerModel;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: TextFormField(
              decoration: const InputDecoration(
                label: Text("Comment"),
                border: OutlineInputBorder(),
              ),
              controller: commentControllerModel.commentCtrl),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: TextFormField(
              decoration: const InputDecoration(
                label: Text("Motive"),
                border: OutlineInputBorder(),
              ),
              controller: commentControllerModel.motiveCtrl),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: TextFormField(
              decoration: const InputDecoration(
                label: Text("Language"),
                border: OutlineInputBorder(),
              ),
              controller: commentControllerModel.langCtrl),
        ),
        ElevatedButton(
            onPressed: () async {
              var response = await Get.find<AdminVM>().addComments(commentControllerModel);
              if (response) {
                Get.snackbar("Success", "Successfully Added",
                    colorText: Colors.white, backgroundColor: Colors.green);
              } else {
                Get.snackbar("Error", "An Error Occured",
                    colorText: Colors.white, backgroundColor: Colors.red);
              }
            },
            child: const Text("Add Category"))
      ],
    ));
  }
}
