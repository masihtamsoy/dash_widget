/// INFO Add listing related @action, @observable
/// getAllJobs(), getAllCompanyRole()

import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:supabase/supabase.dart' as supa;
import '../common/supabase_service.dart';

// Include generated file
part 'listing_store.g.dart';

// This is the class used by rest of your codebase
class ListingStore = _ListingStore with _$ListingStore;

// The store-class
abstract class _ListingStore with Store {
  @observable
  late List data = [];

  @observable
  int value = 0;

  @observable
  Map? selectedItem;

  @computed
  int get totalItems => data.length;

  Map getItem(int index) {
    dynamic item = {};
    if (index < totalItems) {
      item = data[index];
    }

    return item as Map;
  }

  @action
  void increment() {
    value++;
  }

  @action
  void selectItem(Map item) {
    selectedItem = item;
    print("-----selectedItem-------$item");
  }

  @action
  Future getJobListing(String mobile, String companyCode) async {
    final client = supa.SupabaseClient(
        SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

    // final selectResponse = await client.from("jobs").select("*").execute();

    final response = await client.rpc('get_job_list', params: {
      'company_code_param': companyCode,
      'mobile_number_param': mobile
    }).execute();

    data = [];
    if (response.error == null) {
      data = response.data as List;
      print(">>data>>>>${response.data}");
    } else {
      print(">>>>data error>>>> ${response.error}");
    }
  }

  @action
  Future getAllCompanyRole() async {
    final client = supa.SupabaseClient(
        SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

    final response = await client
        .from('company_role')
        .select('id,company(id,name),role(id,name)')
        .execute();

    data = [];
    if (response.error == null) {
      data = response.data as List;
      print(">>data>>>>${response.data}");
    } else {
      print(">>>>data error>>>> ${response.error}");
    }
  }

  @action
  Future getAllJobs() async {
    final client = supa.SupabaseClient(
        SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

    final response = await client.from('jobs').select('*').execute();

    data = [];
    if (response.error == null) {
      data = response.data as List;
      print(">>data>>>>${response.data}");
    } else {
      print(">>>>data error>>>> ${response.error}");
    }
  }

  @action
  Future getApplicationListing(int jobId) async {
    final client = supa.SupabaseClient(
        SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

    // final selectResponse = await client.from("jobs").select("*").execute();

    final response = await client
        .from('application')
        .select('*, onboarding(*)')
        .eq('job_id', jobId)
        .execute();

    data = [];
    if (response.error == null) {
      data = response.data as List;
      print(">>data>>>>${response.data}");
    } else {
      print(">>>>data error>>>> ${response.error}");
    }
  }

  @action
  Future getCandidateListing(int companyRoleId) async {
    final client = supa.SupabaseClient(
        SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

    // final selectResponse = await client.from("jobs").select("*").execute();

    final response = await client
        .from('candidate_company_role')
        .select('internal_status,external_status,candidates(name, mobile)')
        .eq('company_role_id', companyRoleId)
        .execute();

    data = [];
    if (response.error == null) {
      data = response.data as List;
      print(">>data>>>>${response.data}");
    } else {
      print(">>>>data error>>>> ${response.error}");
    }
  }
}
