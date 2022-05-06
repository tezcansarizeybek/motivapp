import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/controller_models/admin_controller_model.dart';
import 'package:motivapp/model/controller_models/comment_controller_model.dart';
import 'package:motivapp/view/widgets/admin_widgets/comment_form_widget.dart';
import 'package:motivapp/view/widgets/admin_widgets/motive_form_widget.dart';
import 'package:motivapp/view_model/admin_vm.dart';

class AdminPage extends StatelessWidget {
  AdminPage({Key? key}) : super(key: key);
  AdminControllerModel adminControllerModel = AdminControllerModel();
  CommentControllerModel commentControllerModel = CommentControllerModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
        centerTitle: true,
      ),
      body: GetBuilder<AdminVM>(
          init: Get.put(AdminVM()),
          builder: (logic) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    MotiveFormWidget(adminControllerModel: adminControllerModel),
                    CommentFormWidget(commentControllerModel: commentControllerModel)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
