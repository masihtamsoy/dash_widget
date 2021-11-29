import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../store/jobs_store.dart'; // Import the JobStore

class JobCardWidget extends StatelessWidget {
  final String title;
  final String companyName;
  final String location;
  final String salary;
  final String iconUri;
  final VoidCallback? onPressed;

  const JobCardWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.companyName,
    this.location = "N.A",
    this.salary = "N.A",
    this.iconUri = "N.A",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobsStore _jobsStore = Provider.of<JobsStore>(context, listen: true);

    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
          child: Column(
            children: [
              // //INFO: observe state change
              /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
              // '${context.watch<Counter>().count}',
              /// other way to watch
              // Observer(
              //     builder: (_) => Text(
              //           '${_jobsStore.value}',
              //           style: const TextStyle(fontSize: 40),
              //         )),
              ListTile(
                // leading: Icon(Icons.arrow_drop_down_circle),
                // INFO: observe initial store value
                title: Text(
                  title, // "$title",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.work),
                        Text(companyName),
                        // Text('$company_name'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_city),
                        Text(location)
                        // Text('$location'),
                      ],
                    ),
                  ],
                ),
                // TODO: reimplement
                trailing: SvgPicture.network(
                  iconUri,
                  semanticsLabel: 'A shark?!',
                  placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.money),
                    Text(
                      salary,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Test comprises of MCQ and Aptitude now",
                    style: TextStyle(fontSize: 10),
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: onPressed,
                    // onPressed: () {
                    //   print("increment");
                    //   _jobsStore.increment();
                    //   _jobsStore.selectJob(_jobsStore.getJob(index));
                    //   // TODO: bring this to life
                    //   // // maintain state: job_selected
                    //   // Provider.of<ExamEvaluateModal>(context, listen: false)
                    //   //     .job_select(_getJob(index));

                    //   // Navigator.push(
                    //   //   context,
                    //   //   MaterialPageRoute(
                    //   //       builder: (context) =>
                    //   //           new QuestionJourney(screenIndex: 0)),
                    //   // );
                    // },
                    child: const Text(
                      'Start Test Now!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              // Image.asset('assets/card-sample-image-2.jpg'),
            ],
          ),
        ));
  }
}
