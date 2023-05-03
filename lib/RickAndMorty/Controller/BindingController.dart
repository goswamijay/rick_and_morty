import 'package:get/get.dart';

import 'LocationMainApi.dart';

class BindingController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<Apis>(() => Apis());
  }

}