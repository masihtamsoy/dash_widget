import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../store/jobs_store.dart'; // Import the JobStore

class JobCardWidget extends StatelessWidget {
  const JobCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobsStore _jobsStore = Provider.of<JobsStore>(context, listen: true);

    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
          child: Column(
            children: [
              //INFO: observe state change
              Observer(
                  builder: (_) => Text(
                        '${_jobsStore.value}',
                        style: const TextStyle(fontSize: 40),
                      )),
              ListTile(
                // leading: Icon(Icons.arrow_drop_down_circle),
                // INFO: observe initial store value
                title: Text(
                  '${_jobsStore.value}', // "$title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.work),
                        Text("company_name_holder"),
                        // Text('$company_name'),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.location_city),
                        Text('location_holder'),
                        // Text('$location'),
                      ],
                    ),
                  ],
                ),
                // TODO: reimplement
                // trailing: SvgPicture.network(
                //   _getJob(index)['icon_uri'],
                //   semanticsLabel: 'A shark?!',
                //   placeholderBuilder: (BuildContext context) => Container(
                //       padding: const EdgeInsets.all(30.0),
                //       child: const CircularProgressIndicator()),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.money),
                    Text(
                      'salary_holder',
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
                    onPressed: () {
                      print("increment");
                      _jobsStore.increment();
                      // TODO: bring this to life
                      // // maintain state: job_selected
                      // Provider.of<ExamEvaluateModal>(context, listen: false)
                      //     .job_select(_getJob(index));

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           new QuestionJourney(screenIndex: 0)),
                      // );
                    },
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
