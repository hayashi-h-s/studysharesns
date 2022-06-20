import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class FunctionUtils {
  static Future<XFile?> getImageFromGallery() async {
    ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  static Future<dynamic> uploadImage(String uid, File image) async {
    final FirebaseStorage storageInstance = FirebaseStorage.instance;
    final Reference ref = storageInstance.ref();
    try {
      await ref.child(uid).putFile(image);
      String downloadUrl = await storageInstance.ref(uid).getDownloadURL();
      if (kDebugMode) {
        print("画像登録成功 = $downloadUrl");
      }
      return downloadUrl;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("画像登録失敗 =  ${e}");
      }
      return false;
    }
  }
}
