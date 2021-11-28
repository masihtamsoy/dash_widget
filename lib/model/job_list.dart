import 'package:dash_widget/model/job.dart';

class JobList {
  final List<Job>? jobs;

  JobList({
    this.jobs,
  });

  factory JobList.fromJson(List<dynamic> json) {
    List<Job> jobs = <Job>[];
    jobs = json.map((job) => Job.fromMap(job)).toList();

    return JobList(
      jobs: jobs,
    );
  }
}
