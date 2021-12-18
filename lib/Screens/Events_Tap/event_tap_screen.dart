
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_redy/Model/event.dart';
import 'package:hakathon_redy/Screens/Events_Tap/TabScreens/action_screen.dart';
import 'package:hakathon_redy/Screens/Events_Tap/TabScreens/end_screen.dart';
import 'package:hakathon_redy/api/controllers/user_api_controller.dart';
import 'package:hexcolor/hexcolor.dart';


class EventTap extends StatefulWidget {
  EventTap({Key? key,required this.id}) : super(key: key);

  String id;
  @override
  _EventTapState createState() => _EventTapState();
}

class _EventTapState extends State<EventTap>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // List<BookAll> allBookList = [];
  // List<BookAll> athorBook = [];

  // void getData() {
  //   for (int i = 0; i < allBookList.length; i++) {
  //     if (allBookList[i].nameAuthor == widget.authors.name) {
  //       athorBook.add(allBookList[i]);
  //     }
  //   }
  // }
  late Future<List<Event>> _future;
  List<Event> _categories = <Event>[];
  @override
  void initState() {
    // allBookList = BookAllGetxController.to.bookAll.value;
    // getData();
    _future = UserApiController().getEvent("1");
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            margin: EdgeInsets.only(top: 56.h, left: 24.w),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          // Stack(
          //   children: [
          //     Container(
          //       height: 152.h,
          //       color: HexColor("#253975"),
          //     ),
          //     Container(
          //       margin: EdgeInsets.only(top: 60.h),
          //       child: CircleAvatar(
          //         radius: 40.w,
          //         backgroundColor: Colors.white,
          //         backgroundImage: AssetImage("image/Mask Group 8.png"),
          //       ),
          //     ),
          //   ],
          // ),
          Container(
            margin: EdgeInsets.only(top: 60.h),
            child: CircleAvatar(
              radius: 40.w,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("image/Mask Group 8.png"),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "Category Name",
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "12 Event" ,
            style: TextStyle(fontSize: 14.sp,color: Colors.red),
          ),
          SizedBox(
            height: 40.h,
          ),
          TabBar(
              onTap: (int selectedTabIndex) {},
              padding: EdgeInsets.symmetric(horizontal: 24.w),
               indicatorColor: Colors.black,
              // labelStyle: TextStyle(color: Colors.black),
              labelColor: Colors.black,
              controller: _tabController,
              // unselectedLabelColor: Text3,
              tabs: [
                Tab(
                  text: "Event",
                ),

              ]),
          SizedBox(
            height: 16.h,
          ),
          FutureBuilder<List<Event>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                _categories = snapshot.data ?? [];
                return  Expanded(
                  //  height: 417.h,
                  child: TabBarView(controller: _tabController, children: [
                    ActionScreens(
                        categories:_categories,
                    ),
                  ]),
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

        ],
      ),
    );
  }
}
