import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_redy/Model/event.dart';
import 'package:hakathon_redy/api/controllers/user_api_controller.dart';
class EventDetalis extends StatefulWidget {
   EventDetalis({Key? key,required this.id}) : super(key: key);
  String id;
  @override
  _EventDetalisState createState() => _EventDetalisState();
}

class _EventDetalisState extends State<EventDetalis> {
  late Future<Event?> _future;
 // Event _categories = Event();
  @override
  void initState() {
    _future=UserApiController().getEventDitales(widget.id);
    // TODO: implement initState
    super.initState();
  }
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
          actions: [
            IconButton(onPressed: () {
              
            }, icon: Icon(Icons.add_comment,color: Colors.black,)),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.camera_alt,color: Colors.black,)),
          ],
        ),
      body:
      FutureBuilder<Event?>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.name!=null) {
        //    _categories = snapshot.data ?? Event();
            return  Padding(
              padding:  EdgeInsets.symmetric(vertical: 22.h,horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 216.h,
                    child: Stack(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            height: 216.h,
                            child: Image.network(
                              snapshot.data!.imageUrl,
                              fit: BoxFit.fill,
                            )),
                        Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Container(
                            margin: EdgeInsets.only(left: 8.w,bottom: 18.h),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(.5),),
                            height: 35.h,
                            width: 81.w,
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(width: 10.w,),
                                  Icon(Icons.timer_sharp),
                                  SizedBox(width: 5.w,),
                                  Text(snapshot.data!.durationHours.toString(),style: TextStyle(fontSize: 11.sp,color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: Container(
                            margin: EdgeInsets.only(left: 8.w,bottom: 60.h),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(.5),),
                            height: 35.h,
                            width: 81.w,

                            child: Center(
                              child: Row(

                                children: [
                                  SizedBox(width: 10.w,),
                                  Image.asset("image/Group 19085.png",color: Colors.white,),
                                  SizedBox(width: 5.w,),
                                  Text("6 Events",style: TextStyle(fontSize: 11.sp,color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Text(snapshot.data!.name,style: TextStyle(color: Colors.black,fontSize: 22.sp,fontWeight: FontWeight.w700),),Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.watch_later_outlined,color: Color(0xff23203F),),
                          SizedBox(width: 5.w,),
                          Text(
                           snapshot.data!.time,
                            // '9.00 am',
                            // 'Quantity: 5',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 10.sp,
                              color: const Color(0xff23203F),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today_rounded,color: Color(0xff23203F),),
                          SizedBox(width: 5.w,),
                          Text(
                            snapshot.data!.date,
                            // '12/12/2022',
                            // 'Quantity: 5',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 10.sp,
                              color: const Color(0xff23203F),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          const Icon(Icons.image,color: Color(0xff23203F),),
                          SizedBox(width: 5.w,),
                          Text(
                            snapshot.data!.toString(),
                            // '10',
                            // 'Quantity: 5',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 10.sp,
                              color: const Color(0xff23203F),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListTile(contentPadding: EdgeInsets.zero,title: Text("Location",style: TextStyle(color: Colors.black,fontSize: 15.sp),),leading: Icon(Icons.location_pin,color: Colors.black,),),
                  ListTile(contentPadding: EdgeInsets.zero,title: Text("Info",style: TextStyle(color: Colors.black,fontSize: 15.sp),),leading: Icon(Icons.info,color: Colors.black,),),
                  Text(snapshot.data!.info,style: TextStyle(color: Colors.black,fontSize: 15.sp),),

                ],),
            );
          } else {
            return Center(
              child: Column(
                children: const [
                  Icon(Icons.warning, size: 80),
                  Text(
                    'NO DATA',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),


    );
  }
}
