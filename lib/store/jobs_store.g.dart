// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$JobsStore on _JobsStore, Store {
  final _$selectedJobAtom = Atom(name: '_JobsStore.selectedJob');

  @override
  Map<dynamic, dynamic>? get selectedJob {
    _$selectedJobAtom.reportRead();
    return super.selectedJob;
  }

  @override
  set selectedJob(Map<dynamic, dynamic>? value) {
    _$selectedJobAtom.reportWrite(value, super.selectedJob, () {
      super.selectedJob = value;
    });
  }

  final _$valueAtom = Atom(name: '_JobsStore.value');

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

  final _$jobListAtom = Atom(name: '_JobsStore.jobList');

  @override
  dynamic get jobList {
    _$jobListAtom.reportRead();
    return super.jobList;
  }

  @override
  set jobList(dynamic value) {
    _$jobListAtom.reportWrite(value, super.jobList, () {
      super.jobList = value;
    });
  }

  final _$getJobListingAsyncAction = AsyncAction('_JobsStore.getJobListing');

  @override
  Future getJobListing(String mobile, String companyCode) {
    return _$getJobListingAsyncAction
        .run(() => super.getJobListing(mobile, companyCode));
  }

  final _$_JobsStoreActionController = ActionController(name: '_JobsStore');

  @override
  void increment() {
    final _$actionInfo =
        _$_JobsStoreActionController.startAction(name: '_JobsStore.increment');
    try {
      return super.increment();
    } finally {
      _$_JobsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectJob(Map<dynamic, dynamic> job) {
    final _$actionInfo =
        _$_JobsStoreActionController.startAction(name: '_JobsStore.selectJob');
    try {
      return super.selectJob(job);
    } finally {
      _$_JobsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getTotalJobs() {
    final _$actionInfo = _$_JobsStoreActionController.startAction(
        name: '_JobsStore.getTotalJobs');
    try {
      return super.getTotalJobs();
    } finally {
      _$_JobsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getJob(int index) {
    final _$actionInfo =
        _$_JobsStoreActionController.startAction(name: '_JobsStore.getJob');
    try {
      return super.getJob(index);
    } finally {
      _$_JobsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedJob: ${selectedJob},
value: ${value},
jobList: ${jobList}
    ''';
  }
}
