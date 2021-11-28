import 'package:mobx/mobx.dart';
import 'package:dash_widget/model/job_list.dart';

// Include generated file
part 'jobs_store.g.dart';

// This is the class used by rest of your codebase
class JobsStore = _JobsStore with _$JobsStore;

// The store-class
abstract class _JobsStore with Store {
  @observable
  int value = 2;

  // @observable
  // JobList? jobList;

  @observable
  List? jobList;

  @action
  void increment() {
    value++;
  }

  // // actions:-------------------------------------------------------------------
  // @action
  // Future getPosts() async {
  //   final future = _repository.getPosts();
  //   fetchPostsFuture = ObservableFuture(future);

  //   future.then((postList) {
  //     this.postList = postList;
  //   }).catchError((error) {
  //     errorStore.errorMessage = DioErrorUtil.handleError(error);
  //   });
  // }

  @action
  Future getJobs(String mobile, String companyCode) async {
    // Based on
    this.jobList = [
      {
        "id": 3,
        "created_at": "2021-11-08T17:20:47.629+00:00",
        "title": "Delivery Boy",
        "company_name": "Swiggy",
        "salary": "₹ 1,20,000 - 3,00,000 P.A",
        "location": "Bengaluru",
        "icon_uri":
            "https://res.cloudinary.com/dmtuysbcn/image/upload/v1636916694/icons/delivery-fa_cda5zg.svg",
        "company_code": "DASH_20"
      },
      {
        "id": 2,
        "created_at": "2021-11-08T17:20:47.629+00:00",
        "title": "Telesales Executives",
        "company_name": "Uber Technologies",
        "salary": "₹ 1,20,000 - 3,00,000 P.A",
        "location": "Bengaluru",
        "icon_uri":
            "https://res.cloudinary.com/dmtuysbcn/image/upload/v1636916808/icons/telesales-fa_vuzdl5.svg",
        "company_code": "DASH_20"
      }
    ];
  }

  // dynamic getJobListing() async {
  //   String mobile =
  //       Provider.of<ExamEvaluateModal>(context, listen: false).mobile;

  //   String companyCode =
  //       Provider.of<ExamEvaluateModal>(context, listen: false).company_code;

  //   print("getJobListing >>>>>> $mobile $companyCode");

  //   final client = supa.SupabaseClient(
  //       SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

  //   // final selectResponse = await client.from("jobs").select("*").execute();

  //   final selectResponse = await client.rpc('get_job_list', params: {
  //     'company_code_param': companyCode,
  //     'mobile_number_param': mobile
  //   }).execute();

  //   data = json.encode({});

  //   if (selectResponse.error == null) {
  //     print('response.data: ${selectResponse.data}');
  //     data = json.encode({"jobs": selectResponse.data});

  //     // print("<><><><><><><><><><><>< $data");
  //   } else {
  //     // print('>>>>>>>>>>>>>>>>>>>selectResponse.error: ${selectResponse.error}');
  //     FocusScope.of(context).unfocus();
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(selectResponse.error.message)));
  //   }

  //   return data;
  // }

}
