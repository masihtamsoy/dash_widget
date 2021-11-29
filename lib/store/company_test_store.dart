import 'package:mobx/mobx.dart';

// Include generated file
part 'company_test_store.g.dart';

// This is the class used by rest of your codebase
class CompanyTestStore = _CompanyTestStore with _$CompanyTestStore;

// The store-class
abstract class _CompanyTestStore with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
