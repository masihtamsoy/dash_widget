import 'dart:convert';
import 'package:mobx/mobx.dart';
// INFO: Its better to use model and use it
// import 'package:dash_widget/model/job_list.dart';

import 'package:supabase/supabase.dart' as supa;
import '../common/supabase_service.dart';

// Include generated file
part 'jobs_store.g.dart';

// This is the class used by rest of your codebase
class JobsStore = _JobsStore with _$JobsStore;

// The store-class
abstract class _JobsStore with Store {
  late String data;

  @observable
  Map? selectedJob;

  @observable
  int value = 2;

  // @observable
  // JobList? jobList;

  @observable
  dynamic jobList;

  // @observable
  // String? jobsString;

  @action
  void increment() {
    value++;
  }

  // // actions:-------------------------------------------------------------------
  @action
  void selectJob(Map job) {
    selectedJob = job;
  }

  @action
  dynamic getJobListing(String mobile, String companyCode) async {
    print("getJobListing >>>>>> $mobile $companyCode");

    final client = supa.SupabaseClient(
        SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

    // final selectResponse = await client.from("jobs").select("*").execute();

    final selectResponse = await client.rpc('get_job_list', params: {
      'company_code_param': companyCode,
      'mobile_number_param': mobile
    }).execute();

    data = json.encode({});

    if (selectResponse.error == null) {
      // print('response.data: ${selectResponse.data}');
      data = json.encode({"jobs": selectResponse.data});
      print("response.data: ${data}");
    } else {
      // print('>>>>>>>>>>>>>>>>>>>selectResponse.error: ${selectResponse.error}');
    }

    // jobsString = data;

    return data;
  }

  @action
  int getTotalJobs() {
    final totalJobs = json.decode(data)['jobs']?.length ?? 0;

    return totalJobs;
  }

  @action
  getJob(int index) {
    final job = json.decode(data)['jobs'][index];

    return job;
  }
}
