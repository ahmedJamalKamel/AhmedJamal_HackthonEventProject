import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_redy/DateAndTimePecker/date_time_picker.dart';
import 'package:hakathon_redy/Screens/Events_Tap/event_tap_screen.dart';
import 'package:hakathon_redy/Screens/category_screen.dart';
import 'package:hakathon_redy/Screens/cereat_new_event_screen.dart';
import 'package:hakathon_redy/Screens/event_detalis.dart';
import 'package:hakathon_redy/Screens/event_image_screen.dart';
import 'package:hakathon_redy/Screens/lanuch_screen.dart';
import 'package:hakathon_redy/Screens/login_screens.dart';
import 'package:hakathon_redy/prefs/shared_pref_controller.dart';

import 'DateAndTimePecker/flutter_datetime_picker.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();

  runApp( MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return  ScreenUtilInit(
      designSize: const Size(375,812),
    builder:() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/lanuch_screen',
        routes: {
          '/flutter_datetime_picker': (context) => HomePage(),
          '/date_time_picker': (context) => DateTimePicker(),
          '/login_screen': (context) => LoginScreen(),
          '/category_screen': (context) => CategoryScreen(),
         // '/event_tap_screen': (context) => EventTap(),
          //'/event_detalis': (context) => EventDetalis(),
          '/event_image_screen': (context) => EventImageScreen(),
          '/lanuch_screen': (context) => LunchScreen(),
        //  '/cereat_new_event_screen': (context) => NewEventScreen(),
        },
      );
    } ,
  );
  }
}

