import 'package:flutter/material.dart';
import 'package:dash_widget/src/job_card_widget.dart';
import 'package:dash_widget/store/jobs_store.dart';

// INFO: Create base classes, for good inheritance practices
// class JobStoreWidgetWrapper<T, V> extends JobStoreWidgetWrapper<T, V> {
class JobStoreWidgetWrapper extends StatefulWidget {
  JobStoreWidgetWrapper({Key? key}) : super(key: key);

  @override
  _StoreWidgetWrapperState createState() => _StoreWidgetWrapperState();
}

class _StoreWidgetWrapperState extends State<JobStoreWidgetWrapper> {
  final _jobStore = Provider.of<PostStore>(context);

  @override
  Widget build(BuildContext context) {
    return const JobCardWidget();
  }
}