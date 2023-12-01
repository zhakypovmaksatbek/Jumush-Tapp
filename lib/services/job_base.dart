import 'package:jumush_tapp/product/model/job_model.dart';

abstract class JobBase {
  Future<List<Job>> fetchData();
  Future<void> addJob(Job job, String userID);
  Future<List<Job>> getJobsByUser(String userId);
  Future<void> deleteJob(String jobID, String userID);
}
