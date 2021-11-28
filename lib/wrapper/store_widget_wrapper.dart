import 'package:flutter/material.dart';
import 'package:dash_widget/src/job_card_widget.dart';

// INFO: Create base classes, for better inhe
// class JobStoreWidgetWrapper<T, V> extends JobStoreWidgetWrapper<T, V> {
class JobStoreWidgetWrapper extends StatefulWidget {
  JobStoreWidgetWrapper({Key? key}) : super(key: key);

  @override
  _StoreWidgetWrapperState createState() => _StoreWidgetWrapperState();
}

class _StoreWidgetWrapperState extends State<JobStoreWidgetWrapper> {
  @override
  Widget build(BuildContext context) {
    return const JobCardWidget();
  }
}
