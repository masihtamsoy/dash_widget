import 'package:flutter/material.dart';
import 'package:dash_widget/dash_widget.dart';

class Journey extends StatelessWidget {
  const Journey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const JobStoreWidgetWrapper(),
      ],
    );
  }
}
