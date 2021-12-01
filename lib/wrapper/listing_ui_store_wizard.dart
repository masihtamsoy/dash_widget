import 'package:flutter/material.dart';
import 'package:dash_widget/src/job_card_widget.dart';
import 'package:dash_widget/src/simple_card_widget.dart';
import 'package:dash_widget/store/listing_store.dart';
import 'package:provider/provider.dart';

// INFO: Create base classes, for good inheritance practices
// class ListingUiStoreWizard<T, V> extends ListingUiStoreWizard<T, V> {
class ListingUiStoreWizard extends StatefulWidget {
  final VoidCallback feedback;
  final Widget? child;
  final String? pushRouteName;
  final String? mode;

  const ListingUiStoreWizard(
      {Key? key,
      required this.feedback,
      this.child,
      this.pushRouteName,
      this.mode = "application"})
      : super(key: key);

  @override
  _StoreWidgetWrapperState createState() => _StoreWidgetWrapperState();
}

class _StoreWidgetWrapperState extends State<ListingUiStoreWizard> {
  late ListingStore _listingStore;

  Future<dynamic> _listAllJobsWidget() {
    // Loop over _listingStore.jobList(mobile, company_code)
    // _listingStore.getItems("8011230914", "DASH_20");

    Future<dynamic> myListing;
    switch (widget.mode) {
      case "application":
        myListing = _listingStore.getApplicationListing("2");
        break;
      default:
        myListing = _listingStore.getJobListing("8011230914", "DASH_20");
    }
    print("<><><><><><><><><>< ${myListing}");

    return myListing;
  }

  @override
  void didChangeDependencies() {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    // TODO: implement didChangeDependencies
    _listingStore = Provider.of<ListingStore>(context, listen: true);

    super.didChangeDependencies();
  }

  void _onPressed(int index, Function feedback) {
    _listingStore.increment();
    _listingStore.selectItem(_listingStore.getItem(index));

    feedback();
  }

  Widget _buildPresentation(int index) {
    switch (widget.mode) {
      case "job":
        return _buildJobPresentation(index);
      default:
        return _buildApplicantPresentation(index);
    }
  }

  Widget _buildApplicantPresentation(int index) {
    String mobile = _listingStore.getItem(index)['mobile'];
    String jobId = "1234";

    return SimpleCardWidget(
      title: mobile,
      subtitle: jobId,
    );
  }

  Widget _buildJobPresentation(int index) {
    String title = _listingStore.getItem(index)['title'];
    String companyName = _listingStore.getItem(index)['company_name'];
    String location = _listingStore.getItem(index)['location'];
    String salary = _listingStore.getItem(index)['salary'];
    String iconUri = _listingStore.getItem(index)['icon_uri'];

    return JobCardWidget(
      title: title,
      companyName: companyName,
      location: location,
      salary: salary,
      iconUri: iconUri,
      onPressed: () {
        Function feedback = () => {};
        _onPressed(index, feedback);

        Navigator.pushNamed(context, '/second');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _listAllJobsWidget(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Please wait its loading...'));
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Column(children: [
                _listingStore.totalItems == 0
                    ? Text("")
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        // itemCount: _listingStore.totalItems, // the length
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return _buildPresentation(index);
                          // return Text('${_listingStore.getItem(index)}');
                        })
              ]);
            }
          }
        });
  }
}
