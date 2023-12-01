import 'package:flutter/foundation.dart';
import 'package:jumush_tapp/product/model/job_model.dart';
import 'package:jumush_tapp/services/job_base.dart';

class JobViewModel extends ChangeNotifier implements JobBase {
  @override
  Future<void> deleteJob(String jobID, String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<Job>> fetchData() {
    throw UnimplementedError();
  }

  @override
  Future<List<Job>> getJobsByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<void> addJob(Job job, String userID) {
    throw UnimplementedError();
  }
}
