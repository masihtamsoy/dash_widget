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

    print("---getitem-------$index");
    return item as Map;
  }

  @action
  void increment() {
    value++;
  }

  @action
  void selectItem(Map item) {
    selectedItem = item;
    print("---item-------$item");
  }

  Future getApplicationListing(String jobId) async {
    final client = supa.SupabaseClient(
        SupaConstants.supabaseUrl, SupaConstants.supabaseKey);

    // final selectResponse = await client.from("jobs").select("*").execute();

    final response = await client
        .from('application')
        .select('*')
        .eq('job_id', '2')
        .execute();

    data = [];
    if (response.error == null) {
      data = response.data as List;
      print(">>>>>>${response.data}");
    } else {
      print(">>>> ${response.error}");
    }
  }
}
