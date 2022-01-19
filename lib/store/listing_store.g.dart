// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListingStore on _ListingStore, Store {
  Computed<int>? _$totalItemsComputed;

  @override
  int get totalItems =>
      (_$totalItemsComputed ??= Computed<int>(() => super.totalItems,
              name: '_ListingStore.totalItems'))
          .value;

  final _$dataAtom = Atom(name: '_ListingStore.data');

  @override
  List<dynamic> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<dynamic> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$valueAtom = Atom(name: '_ListingStore.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$selectedItemAtom = Atom(name: '_ListingStore.selectedItem');

  @override
  Map<dynamic, dynamic>? get selectedItem {
    _$selectedItemAtom.reportRead();
    return super.selectedItem;
  }

  @override
  set selectedItem(Map<dynamic, dynamic>? value) {
    _$selectedItemAtom.reportWrite(value, super.selectedItem, () {
      super.selectedItem = value;
    });
  }

  final _$getJobListingAsyncAction = AsyncAction('_ListingStore.getJobListing');

  @override
  Future<dynamic> getJobListing(String mobile, String companyCode) {
    return _$getJobListingAsyncAction
        .run(() => super.getJobListing(mobile, companyCode));
  }

  final _$getAllCompanyRoleAsyncAction =
      AsyncAction('_ListingStore.getAllCompanyRole');

  @override
  Future<dynamic> getAllCompanyRole() {
    return _$getAllCompanyRoleAsyncAction.run(() => super.getAllCompanyRole());
  }

  final _$getAllJobsAsyncAction = AsyncAction('_ListingStore.getAllJobs');

  @override
  Future<dynamic> getAllJobs() {
    return _$getAllJobsAsyncAction.run(() => super.getAllJobs());
  }

  final _$getApplicationListingAsyncAction =
      AsyncAction('_ListingStore.getApplicationListing');

  @override
  Future<dynamic> getApplicationListing(int jobId) {
    return _$getApplicationListingAsyncAction
        .run(() => super.getApplicationListing(jobId));
  }

  final _$getCandidateListingAsyncAction =
      AsyncAction('_ListingStore.getCandidateListing');

  @override
  Future<dynamic> getCandidateListing(int companyRoleId) {
    return _$getCandidateListingAsyncAction
        .run(() => super.getCandidateListing(companyRoleId));
  }

  final _$_ListingStoreActionController =
      ActionController(name: '_ListingStore');

  @override
  void increment() {
    final _$actionInfo = _$_ListingStoreActionController.startAction(
        name: '_ListingStore.increment');
    try {
      return super.increment();
    } finally {
      _$_ListingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectItem(Map<dynamic, dynamic> item) {
    final _$actionInfo = _$_ListingStoreActionController.startAction(
        name: '_ListingStore.selectItem');
    try {
      return super.selectItem(item);
    } finally {
      _$_ListingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
value: ${value},
selectedItem: ${selectedItem},
totalItems: ${totalItems}
    ''';
  }
}
