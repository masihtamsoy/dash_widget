import 'package:flutter/material.dart';
import 'package:dash_widget/src/job_card_widget.dart';
import 'package:dash_widget/store/jobs_store.dart';
import 'package:provider/provider.dart';

// INFO: Create base classes, for good inheritance practices
// class JobStoreWidgetWrapper<T, V> extends JobStoreWidgetWrapper<T, V> {
class JobStoreWidgetWrapper extends StatefulWidget {
  JobStoreWidgetWrapper({Key? key}) : super(key: key);

  @override
  _StoreWidgetWrapperState createState() => _StoreWidgetWrapperState();
}

class _StoreWidgetWrapperState extends State<JobStoreWidgetWrapper> {
  late JobsStore _jobsStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _jobsStore = Provider.of<JobsStore>(context);

    // TODO: // check to see if already called api
    // if (!_jobsStore.loading) {
    //   _jobsStore.getPosts();
    // }
  }

  // final _jobStore = Provider.of<JobsStore>(context);

  @override
  Widget build(BuildContext context) {
    return JobCardWidget();
  }
}
