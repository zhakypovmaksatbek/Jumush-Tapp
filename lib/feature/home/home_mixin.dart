import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jumush_tapp/feature/home/home_page.dart';
import 'package:jumush_tapp/product/model/job_model.dart';

mixin HomeMixin on State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Job> jobs = [];
  bool loading = false;
  final int _perPage = 4;
  DocumentSnapshot? _lastDocument;

  @override
  void initState() {
    super.initState();
    getJobs();
  }

  Future<void> getJobs() async {
    if (loading) {
      return;
    }

    setState(() {
      loading = true;
    });

    QuerySnapshot querySnapshot;

    try {
      if (_lastDocument == null) {
        querySnapshot = await _firestore
            .collection('jobs')
            .orderBy('whenShare', descending: true)
            .limit(_perPage)
            .get();
      } else {
        querySnapshot = await _firestore
            .collection('jobs')
            .orderBy('whenShare', descending: true)
            .startAfterDocument(_lastDocument!)
            .limit(_perPage)
            .get();
      }

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          jobs.addAll(
            querySnapshot.docs
                .map((doc) => Job.fromJson(doc.data() as Map<String, dynamic>))
                .toList(),
          );
          _lastDocument = querySnapshot.docs.last;
        });
      }
    } catch (e) {
      print('Error fetching jobs: $e');
    } finally {
      setState(() {
        loading = false; // Yüklenme durumunu sıfırla
      });
    }
  }
}
