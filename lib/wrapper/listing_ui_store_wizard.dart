import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dash_widget/src/job_card_widget.dart';
import 'package:dash_widget/src/simple_card_widget.dart';
import 'package:dash_widget/store/listing_store.dart';
import 'package:provider/provider.dart';

// INFO: Create base classes, for good inheritance practices
// class ListingUiStoreWizard<T, V> extends ListingUiStoreWizard<T, V> {
class ListingUiStoreWizard extends StatefulWidget {
  // final Function feedback;
  final Function? getCallbackStore;
  final Widget? child;
  final String pushRouteName;
  final String? mode;
  final Map? dependencyState;

  const ListingUiStoreWizard(
      {Key? key,
      // required this.feedback,
      this.getCallbackStore,
      this.child,
      this.pushRouteName = "",
      this.mode,
      this.dependencyState})
      : super(key: key);

  @override
  _StoreWidgetWrapperState createState() => _StoreWidgetWrapperState();
}

class _StoreWidgetWrapperState extends State<ListingUiStoreWizard> {
  late ListingStore _listingStore;

  Future<dynamic> _listingWidget() {
    print("-------listing widget mode----------${widget.mode}");
    // Loop over _listingStore.jobList(mobile, company_code)
    // _listingStore.getItems("8011230914", "DASH_20");

    late Future<dynamic> myListing;
    switch (widget.mode) {
      case "application":
        int jobId = widget.dependencyState!['id'];
        myListing = _listingStore.getApplicationListing(jobId);
        break;
      case "job":
        myListing = _listingStore.getAllJobs();
        // myListing = _listingStore.getJobListing("8011230914", "DASH_20");
        break;
      case "company_role":
        myListing = _listingStore.getAllCompanyRole();
        break;
      default:
        print("------unknown mode-------- ${widget.mode}");
    }

    return myListing;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _listingStore = Provider.of<ListingStore>(context, listen: true);

    super.didChangeDependencies();
  }

  void _onPressed(int index) {
    _listingStore.increment();
    _listingStore.selectItem(_listingStore.getItem(index));

    switch (widget.mode) {
      case "job":
        widget.getCallbackStore!().selectJob(_listingStore.getItem(index));
        break;
      case "application":
        widget.getCallbackStore!()
            .applicationSelected(_listingStore.getItem(index));
        break;
      default:
    }
  }

  Widget _buildPresentation(int index) {
    switch (widget.mode) {
      case "job":
        return _buildJobPresentation(index);
      case "application":
        return _buildApplicantPresentation(index);
      case "company_role":
        return _buildCompanyRolePresentation(index);
      default:
        return Text("No widget");
    }
  }

  Widget _buildCompanyRolePresentation(int index) {
    String fullname = _listingStore.getItem(index)["company"]["name"];
    String totalScore = _listingStore.getItem(index)["role"]["name"];
    return SimpleCardWidget(
      subtitle: fullname,
      totalScore: totalScore,
    );
  }

  Widget _buildApplicantPresentation(int index) {
    String mobile = _listingStore.getItem(index)['mobile'] ?? "";
    String fullname =
        _listingStore.getItem(index)['onboarding']!['fullname'] ?? "";
    String totalScore = _listingStore.getItem(index)['test_score']!.toString();
    String answers = json.encode(_listingStore.getItem(index)['answers'] ?? {});
    String onboarding =
        json.encode(_listingStore.getItem(index)['onboarding'] ?? {});

    return SimpleCardWidget(
      title: mobile,
      subtitle: fullname,
      onboarding: onboarding,
      answers: answers,
      totalScore: totalScore,
    );
  }

  Widget _buildJobPresentation(int index) {
    String title = _listingStore.getItem(index)['title'] ?? "";
    String companyName = _listingStore.getItem(index)['company_name'] ?? "";
    String location = _listingStore.getItem(index)['location'] ?? "";
    String salary = _listingStore.getItem(index)['salary'] ?? "";
    String iconUri = _listingStore.getItem(index)['icon_uri'] ?? "";

    return JobCardWidget(
      title: title,
      companyName: companyName,
      location: location,
      salary: salary,
      iconUri: iconUri,
      onPressed: () {
        _onPressed(index);

        // INFO: on push without Remove util, on back parent widget not gets build
        // Use pushNamedAndRemoveUntil
        Navigator.pushNamedAndRemoveUntil(
            context, widget.pushRouteName, (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _listingWidget(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Please wait its loading...'));
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return _listingStore.totalItems == 0
                  ? Text("No data")
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _listingStore.totalItems, // the length
                      itemBuilder: (context, index) {
                        return _buildPresentation(index);
                        // return Text('${_listingStore.getItem(index)}');
                      });
            }
          }
        });
  }
}
