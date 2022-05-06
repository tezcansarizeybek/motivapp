import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/controller_models/admin_controller_model.dart';
import 'package:motivapp/view_model/admin_vm.dart';

class MotiveFormWidget extends StatelessWidget {
  const MotiveFormWidget({
    Key? key,
    required this.adminControllerModel,
  }) : super(key: key);

  final AdminControllerModel adminControllerModel;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: TextFormField(
              decoration: const InputDecoration(
                label: Text("Category"),
                border: OutlineInputBorder(),
              ),
              controller: adminControllerModel.categoryCtrl),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: TextFormField(
              decoration: const InputDecoration(
                label: Text("Icon Link"),
                border: OutlineInputBorder(),
              ),
              controller: adminControllerModel.iconCtrl),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: TextFormField(
              decoration: const InputDecoration(
                label: Text("Order"),
                border: OutlineInputBorder(),
              ),
              controller: adminControllerModel.orderCtrl),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: TextFormField(
              decoration: const InputDecoration(
                label: Text("Language"),
                border: OutlineInputBorder(),
              ),
              controller: adminControllerModel.langCtrl),
        ),
        ElevatedButton(
            onPressed: () async {
              var response = await Get.find<AdminVM>().addMotives(adminControllerModel);
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
