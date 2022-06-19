import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String id;
  String userId;
  String name;
  String imagePath;
  String selfIntroduction;
  Timestamp? createdTime;
  Timestamp? updatedTime;

  Account({
    this.id = "",
    this.userId = "",
    this.name = "",
    this.imagePath = "",
    this.selfIntroduction = "",
    this.createdTime,
    this.updatedTime,
  });
}
