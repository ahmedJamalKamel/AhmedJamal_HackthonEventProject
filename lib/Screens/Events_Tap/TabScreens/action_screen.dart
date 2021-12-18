
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_redy/Model/event.dart';
import 'package:hakathon_redy/Screens/event_detalis.dart';

class ActionScreens extends StatefulWidget {
   ActionScreens({Key? key,required this.categories}) : super(key: key);
   List<Event> categories ;
  @override
  _ActionScreensState createState() => _ActionScreensState();
}

class _ActionScreensState extends State<ActionScreens> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: widget.categories.length,
        padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 20.w),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetalis(
                    id:  widget.categories[index].id.toString(),
                  ),
                ),
              );
            },
            child: Container(
              height: 140.h,
              child: Row(children: [
                Container(width: 97.w,height: 79.h,child: Image.network(widget.categories[index].imageUrl,fit: BoxFit.fill,)),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(title: Text("12:00am - 2hours"),trailing: Container(width: 50.w,height: 22.h,decoration: BoxDecoration(
                        color: Colors.green.withOpacity(.5),
                        borderRadius: BorderRadius.circular(10)
                      ),child: Center(child: Text("Active"))),),
                      ListTile(title: Text("Event Name",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.w700),),subtitle:  Text("12/12/2020"),),
                    ],
                  ),
                )
              ],),
            ),
          );
        },
      ),
    );
  }
}
