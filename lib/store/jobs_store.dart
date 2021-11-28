import 'package:mobx/mobx.dart';

// Include generated file
part 'JobsStore.g.dart';

// This is the class used by rest of your codebase
class JobsStore = _JobsStore with _$JobsStore;

// The store-class
abstract class _JobsStore with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}