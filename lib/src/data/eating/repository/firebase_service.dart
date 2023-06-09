import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../services/notification_service.dart';

Future uploadPhoto(String imagePath) async {
  //creating unique file names based on time
  final firebasePath = DateTime.now().millisecondsSinceEpoch.toString();

  //in this location in firebase storage
  final ref = FirebaseStorage.instance.ref().child('meals');
  final firebaseLoaction = ref.child(firebasePath);
  //put this file

  try {
    firebaseLoaction
        .putFile(File(imagePath))
        .snapshotEvents
        .listen((event) async {
      switch (event.state) {
        case TaskState.running:
          //handle task
          break;
        case TaskState.paused:
          //handle task
          break;
        case TaskState.error:
          //handle task
          break;
        case TaskState.canceled:
          //handle task
          break;
        case TaskState.success:
          //send notification
          print('uploadeddddddddddddd');
          await sendNotificaton();
          break;
      }
    });
  } catch (error) {
    debugPrint(error.toString());
  }
}

Future<List<String>> displayPhotos() async {
  List<String> donwloadURLs = [];
  final storageRef = FirebaseStorage.instance.ref().child('meals');
  try {
    final listResult = await storageRef.listAll();
    for (final item in listResult.items) {
      final url = await item.getDownloadURL();
      donwloadURLs.add(url);
    }
  } catch (error) {
    debugPrint(error.toString());
  }
  return donwloadURLs;
}
