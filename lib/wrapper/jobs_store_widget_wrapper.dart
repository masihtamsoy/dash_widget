import 'package:flutter/material.dart';
import 'package:dash_widget/src/job_card_widget.dart';
import 'package:dash_widget/store/jobs_store.dart';
import 'package:provider/provider.dart';

final JobsStore _jobsStore = JobsStore();

// INFO: Create base classes, for good inheritance practices
// class JobStoreWidgetWrapper<T, V> extends JobStoreWidgetWrapper<T, V> {
class JobStoreWidgetWrapper extends StatefulWidget {
  const JobStoreWidgetWrapper({Key? key}) : super(key: key);
  // INFO: Pick mobile and company_code from client
  // mobile
  // company_code

  @override
  _StoreWidgetWrapperState createState() => _StoreWidgetWrapperState();
}

class _StoreWidgetWrapperState extends State<JobStoreWidgetWrapper> {
  List<Widget> _listAllJobsWidget() {
    // Loop over _jobsStore.jobList(mobile, company_code)
    return [const JobCardWidget(), const JobCardWidget()];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _listAllJobsWidget(),
    );
  }
}
