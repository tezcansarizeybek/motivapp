import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/controller_models/admin_controller_model.dart';
import 'package:motivapp/model/comment.dart';
import 'package:motivapp/model/controller_models/comment_controller_model.dart';
import 'package:motivapp/model/motive.dart';
import 'package:uuid/uuid.dart';

class AdminVM extends GetxController {
  TextEditingController adminNickCtrl = TextEditingController();
  TextEditingController adminPassCtrl = TextEditingController();

  login() async {
    var response = await FirebaseFirestore.instance
        .collection("admin")
        .where("nick", isEqualTo: base64Encode(adminNickCtrl.text.codeUnits))
        .where("pass", isEqualTo: base64Encode(adminPassCtrl.text.codeUnits))
        .get();
    if (response.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  addMotives(AdminControllerModel controllerModel) async {
    var uuid = (const Uuid()).v1();
    Motive motive = Motive(
        icon: controllerModel.iconCtrl.text,
        category: controllerModel.categoryCtrl.text,
        local: controllerModel.langCtrl.text,
        order: int.tryParse(controllerModel.orderCtrl.text) ?? 1,
        uuid: uuid);
    try {
      await FirebaseFirestore.instance.collection("motives").add(motive.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  addComments(CommentControllerModel controllerModel) async {
    var uuid = (const Uuid()).v1();
    Comment comment = Comment(
        comment: controllerModel.commentCtrl.text,
        local: controllerModel.langCtrl.text,
        motive: controllerModel.motiveCtrl.text,
        uuid: uuid);
    try {
      await FirebaseFirestore.instance.collection("comments").add(comment.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
