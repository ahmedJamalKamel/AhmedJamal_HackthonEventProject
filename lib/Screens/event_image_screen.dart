import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EventImageScreen extends StatefulWidget {
  const EventImageScreen({Key? key}) : super(key: key);

  @override
  _EventImageScreenState createState() => _EventImageScreenState();
}

class _EventImageScreenState extends State<EventImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme:IconThemeData(color: Colors.black) ,
        title: Text("Event Name",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GridView.builder(
          //physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            childAspectRatio: 162 / 230,
            //  crossAxisSpacing: 154/220,
            crossAxisSpacing: 10,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 163.h,
                      width: 142.w,
                      child: Image.asset(
                        "image/Mask Group.png",
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Image Name",
                    style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "09:00am",
                    style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
