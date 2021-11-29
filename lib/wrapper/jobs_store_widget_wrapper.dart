import 'package:flutter/material.dart';
import 'package:dash_widget/src/job_card_widget.dart';
import 'package:dash_widget/store/jobs_store.dart';
import 'package:provider/provider.dart';

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
  late JobsStore _jobsStore;

  Future _listAllJobsWidget() {
    // Loop over _jobsStore.jobList(mobile, company_code)
    // _jobsStore.getJobs("8011230914", "DASH_20");
    var myjobslisting = _jobsStore.getJobListing("8011230914", "DASH_20");

    print("<><><><><><><><><>< ${myjobslisting}");

    return myjobslisting;
  }

  @override
  void didChangeDependencies() {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    // TODO: implement didChangeDependencies
    _jobsStore = Provider.of<JobsStore>(context, listen: true);

    super.didChangeDependencies();
  }

  void _onPressed(int index) {
    _jobsStore.increment();
    _jobsStore.selectJob(_jobsStore.getJob(index));
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
                _jobsStore.getTotalJobs() == 0
                    ? Text("")
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _jobsStore.getTotalJobs(), // the length
                        itemBuilder: (context, index) {
                          String title = _jobsStore.getJob(index)['title'];
                          String companyName =
                              _jobsStore.getJob(index)['company_name'];
                          String location =
                              _jobsStore.getJob(index)['location'];
                          String salary = _jobsStore.getJob(index)['salary'];
                          String iconUri = _jobsStore.getJob(index)['icon_uri'];

                          return JobCardWidget(
                            title: title,
                            companyName: companyName,
                            location: location,
                            salary: salary,
                            iconUri: iconUri,
                            onPressed: () {
                              _onPressed(index);

                              Navigator.pushNamed(context, '/second');
                            },
                          );
                        })
              ]);
            }
          }
        });
  }
}
