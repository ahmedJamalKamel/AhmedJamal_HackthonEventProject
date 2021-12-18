
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hakathon_redy/Model/event.dart';
import 'package:hakathon_redy/api/controllers/user_api_controller.dart';


class AllDataGetxControler extends GetxController
{
  final UserApiController _apiController=UserApiController();
  Event ditiles=Event();
  RxBool ditilesloding=false.obs;
  RxBool isfavertD=false.obs;


  Future<void> getDitilesProduct(String id) async {
    ditilesloding.value = true;
    ditiles = (await _apiController.getEventDitales(id))!;
    ditilesloding.value = false;
    // notifyListeners();
     update();
  }

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
