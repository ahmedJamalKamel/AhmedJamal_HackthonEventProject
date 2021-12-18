
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EndScreen extends StatefulWidget {
   EndScreen({Key? key,required this.dis}) : super(key: key);
  String dis;
  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 20.w),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 140.h,
            child: Row(children: [
              Container(width: 97.w,height: 79.h,child: Image.asset("image/Mask Group.png",fit: BoxFit.fill,)),
              Expanded(
                child: Column(
                  children: [
                    ListTile(title: Text("12:00am - 2hours"),trailing: Text("Active"),),
                    ListTile(title: Text("Event Name",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.w700),),subtitle:  Text("12/12/2020"),),
                  ],
                ),
              )
            ],),
          );
        },
      ),
    );
  }
}
