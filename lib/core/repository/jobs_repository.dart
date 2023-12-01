// import 'package:jumush_tapp/core/locator/set_up_locator.dart';
// import 'package:jumush_tapp/product/model/job_model.dart';
// import 'package:jumush_tapp/services/job_base.dart';
// import 'package:jumush_tapp/services/job_service.dart';

// class JobsRepository implements JobBase {
//   final JobService _jobService = locator<JobService>();

//   @override
//   Future<void> deleteJob(String jobID, String userID) async {
//     await _jobService.deleteJob(jobID, userID);
//   }

//   @override
//   Future<List<Job>> fetchData() async {
//     final result = await _jobService.fetchData();
//     return result;
//   }

//   @override
//   Future<List<Job>> getJobsByUser(String userId) async {
//     final response = await _jobService.getJobsByUser(userId);
//     return response;
//   }

//   @override
//   Future<void> addJob(Job job, String userID) async {
//     await _jobService.addJob(job, userID);
//   }
// }
