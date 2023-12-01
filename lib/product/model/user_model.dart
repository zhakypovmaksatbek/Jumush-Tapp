// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userID;
  String? email;
  int? jobCount;
  Timestamp? createAt;

  UserModel({
    this.userID,
    this.email,
    this.jobCount,
    this.createAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    email = json['email'];
    jobCount = json['jobCount'];
    createAt = createAt;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['email'] = email;
    data['jobCount'] = jobCount;
    data['createAt'] = createAt;
    return data;
  }

  @override
  String toString() {
    return 'UserModel(userID: $userID, email: $email, jobCount: $jobCount, createAt: $createAt)';
  }
}
