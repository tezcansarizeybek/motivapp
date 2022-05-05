import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/comment.dart';
import 'package:motivapp/model/motive.dart';

class MotiveVM extends GetxController {
  var comment = Comment().obs;

  final motivesRef = FirebaseFirestore.instance.collection('motives').withConverter<Motive>(
        fromFirestore: (snapshots, _) => Motive.fromJson(snapshots.data()!),
        toFirestore: (motive, _) => motive.toJson(),
      );

  getCommentByMotive(String mot) async {
    Get.dialog(Dialog(
      child: Container(
          width: 100,
          height: 250,
          child: const Padding(
            padding: EdgeInsets.all(50),
            child: CircularProgressIndicator(),
          )),
    ));
    var query = await FirebaseFirestore.instance
        .collection("comments")
        .where("motive", isEqualTo: mot)
        .get();
    Random rnd = Random();
    if (query.docs.isNotEmpty) {
      var randomNumber = rnd.nextInt(query.docs.length);
      DocumentSnapshot randomDocument = query.docs[randomNumber];
      comment.value = Comment.fromJson(randomDocument.data());
    }
    if (Get.isDialogOpen ?? false) Get.back();
  }
}
