import 'package:flutter/material.dart';
import 'package:dash_widget/dash_widget.dart';

class AdminListing extends StatefulWidget {
  AdminListing({Key? key}) : super(key: key);

  @override
  _AdminListingState createState() => _AdminListingState();
}

class _AdminListingState extends State<AdminListing> {
  void _onPressed() {
    Navigator.pushNamed(context, '/calling_page');
    // Make api call to get test json, given by candidate
    // _companyTestStore.getTestSubmitted('mobile', 'jobId');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RoundedButtonWidget(
              buttonText: "Dashhire Portal", onPressed: _onPressed),
          RoundedButtonWidget(
              buttonText: "Calling Sheet", onPressed: _onPressed),
          RoundedButtonWidget(
              buttonText: "Client Sheet", onPressed: _onPressed),
        ],
      ),
    );
  }
}
