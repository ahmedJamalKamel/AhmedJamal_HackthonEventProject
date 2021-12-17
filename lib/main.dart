import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hakathon_redy/DateAndTimePecker/date_time_picker.dart';

import 'DateAndTimePecker/flutter_datetime_picker.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/date_time_picker',
      routes: {
        '/flutter_datetime_picker': (context) => HomePage(),
        '/date_time_picker': (context) => DateTimePicker(),
      },
    );
  }
}

