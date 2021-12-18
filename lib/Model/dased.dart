import 'package:hakathon_redy/Model/event.dart';

class BaseProdict {
 late bool status;
 late String message;
 late Event object;


  BaseProdict.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    object =
    (json['object'] != null ? new Event.fromJson(json['object']) : null)!;
  }


}