import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_redy/Model/category.dart';
import 'package:hakathon_redy/api/controllers/user_api_controller.dart';
import 'package:hakathon_redy/helpers/helpers.dart';
import 'package:hakathon_redy/widgets/app_text_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NewEventScreen extends StatefulWidget {
   NewEventScreen({Key? key,required this.cat}) : super(key: key);
  List<Category> cat;
  @override
  _NewEventScreenState createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> with Helpers {
  late TextEditingController _NameEventTextEditingController;
  late TextEditingController _HourstextEditingController;
  late TextEditingController _locationtextEditingController;
  late TextEditingController _infotextEditingController;

//////

  late String _setTime, _setDate;

  late String _hour, _minute, _time;

  late String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }
  late Category dropdownvalue ;
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        var timeFormat = DateFormat('hh:mm');
        timeFormat.parse(selectedTime.format(context));
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ':' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn,]).toString();
        print(_timeController.text.toString());
      });
  }

  @override
  void initState() {
    dropdownvalue=widget.cat[1];
    _NameEventTextEditingController = TextEditingController();
    _HourstextEditingController = TextEditingController();
    _locationtextEditingController = TextEditingController();
    _infotextEditingController = TextEditingController();

    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime
            .now()
            .hour, DateTime
            .now()
            .minute),
        [hh, ':', nn, " ", am]).toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _NameEventTextEditingController.dispose();
    _HourstextEditingController.dispose();
    _locationtextEditingController.dispose();
    _infotextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedFile;

  Future<void> _pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (imageFile != null) {
      setState(() {
        _pickedFile = imageFile;
      });
      // AppLocalizations.of(context)!.getstarted,
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme:IconThemeData(color: Colors.black) ,
        title: Text(
          "Event Name",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
        children: [
          Text(
            "Name",
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.person_outline,
            textEditingController: _NameEventTextEditingController,
            hint: "Enter event name",
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        //    decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          // style: TextStyle(fontSize: 40),
                          textAlign: TextAlign.center,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _dateController,
                          onSaved: (val) {
                            _setDate = val!;
                          },
                          decoration: InputDecoration(
                              disabledBorder:
                              OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // labelText: 'Time',
                              contentPadding: EdgeInsets.only(top: 0.0)),
                        ),
                      ),
                    ),
                    // InkWell(
                    //   onTap: (){},
                    //   child: Container(
                    //     width: 161.w,
                    //     height: 48.h,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         border: Border.all(color: Colors.grey)),
                    //     child: Center(child: Text("21 December 2021",style: TextStyle(fontSize: 12.sp),)),
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(width: 30.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Time",
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    InkWell(
                      onTap: () {
                        _selectTime(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        // decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          // style: TextStyle(fontSize: 40),
                          textAlign: TextAlign.center,
                          onSaved: (val) {
                            _setTime = val!;
                          },
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _timeController,
                          decoration: InputDecoration(
                              disabledBorder:
                              OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // labelText: 'Time',
                              contentPadding: EdgeInsets.all(5)),
                        ),
                      ),
                    ),
                    // InkWell(
                    //   onTap: (){},
                    //   child: Container(
                    //     width: 161.w,
                    //     height: 48.h,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         border: Border.all(color: Colors.grey)),
                    //     child: Center(child: Text("12:00 PM",style: TextStyle(fontSize: 12.sp),)),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Hours",
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.person_outline,
            textEditingController: _HourstextEditingController,
            hint: "No. Of Hours",
            textInputType: TextInputType.number,
            numper: 2,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Category",
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
          SizedBox(
            height: 7.h,
          ),
          DropdownButton<Category>(
            value: dropdownvalue,
            icon: Icon(Icons.keyboard_arrow_down),
            underline: SizedBox(),
            items: widget.cat.map((e) {
              return DropdownMenuItem<Category>(child: Text(e.nameEn),value: e,);
            }).toList(),
            onChanged: (value) {
              setState(() {
                dropdownvalue = value!;
                print(dropdownvalue.nameEn);
              });
            },
          ),

          SizedBox(
            height: 20.h,
          ),
          Text(
            "Location",
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.person_outline,
            textEditingController: _locationtextEditingController,
            hint: "Location",
            textInputType: TextInputType.text,

          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Information",
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.person_outline,
            textEditingController: _infotextEditingController,
            hint: "Enter the description",
            textInputType: TextInputType.text,
            line: 7,
            //// numper: 10,
            ticket: false,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Capture",
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
          Row(
            children: [
              Container(
                width: 120,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: _pickedFile == null
                    ? Center(
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      _pickImage();
                    },
                  ),
                )
                    : Image.file(
                  File(_pickedFile!.path),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            onPressed: () async{
              await   performLCreateEvent();
            },
            //  onPressed: ()async => await performLogin(),
            child: Text(
              "Create new event",
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, 60.h),
              primary: HexColor("#253975"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.w)),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> performLCreateEvent() async {
    if (checkData()) {
      await CreateEvent();
    }
  }
  bool checkData() {
    if (_infotextEditingController.text.isNotEmpty &&
        _locationtextEditingController.text.isNotEmpty &&
        _HourstextEditingController.text.isNotEmpty &&
        _NameEventTextEditingController.text.isNotEmpty &&
        _pickedFile != null&&
        _time.isNotEmpty
    ) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> CreateEvent() async {
    bool status = await UserApiController().createEvent(context: context,
        CategoryId:dropdownvalue.id.toString(),
        name: _NameEventTextEditingController.text,
        info: _infotextEditingController.text,
        date: selectedDate.toString(),
        time: _timeController.text.toString(),
        address: _locationtextEditingController.text,
        durationHours: _HourstextEditingController.text,
        image: File(_pickedFile!.path));
    print(_time);
    if (status) {
      Navigator.pop(context);
    }
  }

}
