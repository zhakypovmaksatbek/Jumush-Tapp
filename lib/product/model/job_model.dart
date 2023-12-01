import 'package:cloud_firestore/cloud_firestore.dart';

class Job {
  Job({
    this.jobID,
    this.nameOrganization,
    this.location,
    this.direction,
    this.whenShare,
    this.salary,
    this.phone,
    this.fullName,
    this.description,
    this.requirement,
    this.titleJob,
    this.userID,
  });

  Job.fromJson(Map<String, dynamic> json) {
    jobID = json['jobID'];
    nameOrganization = json['nameOrganization'];
    direction = json['direction'];
    requirement = json['requirement'];
    whenShare = (json['whenShare'] as Timestamp?)?.toDate();
    titleJob = json['titleJob'];
    userID = json['userID'];
    salary = json['salary'];
    phone = json['phone'];
    location = json['location'];
    fullName = json['fullName'];
    description = json['description'];
  }
  String? jobID;
  String? nameOrganization;
  String? titleJob;
  String? direction;
  String? location;
  String? salary;
  String? phone;
  String? fullName;
  String? description;
  String? userID;
  String? requirement;
  DateTime? whenShare;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['jobID'] = jobID;
    data['nameOrganization'] = nameOrganization;
    data['location'] = location;
    data['direction'] = direction;
    data['whenShare'] = whenShare;
    data['salary'] = salary;
    data['phone'] = phone;
    data['fullName'] = fullName;
    data['titleJob'] = titleJob;
    data['description'] = description;
    data['requirement'] = requirement;
    data['userID'] = userID;
    return data;
  }

  @override
  String toString() {
    return 'Job(phone: $phone, fullName: $fullName,titleJob: $titleJob, description: $description, jobID: $jobID, nameOrganization: $nameOrganization, location: $location,direction: $direction, whenShare: $whenShare, salary: $salary,)';
  }
}
