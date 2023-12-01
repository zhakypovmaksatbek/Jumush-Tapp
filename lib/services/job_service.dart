import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jumush_tapp/product/model/category_model.dart';
import 'package:jumush_tapp/product/model/job_model.dart';
import 'package:jumush_tapp/services/job_base.dart';

class JobService implements JobBase {
  final CollectionReference jobsCollection =
      FirebaseFirestore.instance.collection('jobs');
  final CollectionReference vacancyCountCollection =
      FirebaseFirestore.instance.collection('vacancyCount');

  @override
  Future<void> addJob(Job job, String userID) async {
    try {
      DocumentReference jobReference = await jobsCollection.add(job.toJson());

      String jobID = jobReference.id;

      vacancyCountCollection.doc('vacancyCount').get().then((doc) {
        if (doc.exists) {
          vacancyCountCollection
              .doc('vacancyCount')
              .update({'count': FieldValue.increment(1)});
        } else {
          vacancyCountCollection.doc('vacancyCount').set({'count': 1});
        }
      });

      await jobsCollection.doc(jobID).update({'jobID': jobID});

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .update({'jobCount': FieldValue.increment(1)});
    } catch (e) {
      return;
    }
  }

  @override
  Future<List<Job>> getJobsByUser(String userId) async {
    try {
      QuerySnapshot querySnapshot =
          await jobsCollection.where('userID', isEqualTo: userId).get();

      List<Job> jobs = querySnapshot.docs.map((doc) {
        return Job.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      return jobs;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> deleteJob(String jobID, String userID) async {
    await jobsCollection.doc(jobID).delete();

    await vacancyCountCollection
        .doc('vacancyCount')
        .update({'count': FieldValue.increment(-1)});

    await FirebaseFirestore.instance.collection('users').doc(userID).update({
      'jobCount': FieldValue.increment(-1),
    });
  }

  @override
  Future<List<Job>> fetchData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('jobs')
        .orderBy('whenShare', descending: false)
        .get();
    List<Job> jobList = [];
    for (var doc in querySnapshot.docs) {
      jobList.add(Job.fromJson(doc.data() as Map<String, dynamic>));
    }

    return jobList;
  }

  Future<List<Categories>> fetchCategory() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('categaries').get();
    List<Categories> categoryList = [];
    for (var doc in querySnapshot.docs) {
      categoryList.add(Categories.fromJson(doc.data() as Map<String, dynamic>));
    }
    return categoryList;
  }
}
