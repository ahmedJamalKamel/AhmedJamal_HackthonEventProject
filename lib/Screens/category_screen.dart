import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hakathon_redy/Model/category.dart';
import 'package:hakathon_redy/Screens/Events_Tap/event_tap_screen.dart';
import 'package:hakathon_redy/Screens/cereat_new_event_screen.dart';
import 'package:hakathon_redy/api/controllers/auth_api_controller.dart';
import 'package:hakathon_redy/api/controllers/user_api_controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Category>> _future;
  List<Category> _categories = <Category>[];
  @override
  void initState() {
    _future = UserApiController().getCategories();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme:IconThemeData(color: Colors.black) ,
          title: Text(
            "Categories",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewEventScreen(
                         cat: _categories,
                        ),
                      ),
                    );
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                )),
            IconButton(onPressed: ()async {
              bool state=await AuthApiController().logout();
              if(state)Navigator.pushNamed(context, "/login_screen");
            }, icon: Icon(Icons.login_outlined,color: Colors.black,))
          ],
        ),
        body:FutureBuilder<List<Category>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              _categories = snapshot.data ?? [];
              return  Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: GridView.builder(
                  //physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 164 / 184,
                    //  crossAxisSpacing: 154/220,
                    crossAxisSpacing: 10,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemCount:  _categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventTap(
                              id:  _categories[index].id.toString(),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.w)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 140.h,
                              width: 148.w,
                              child: Stack(
                                children: [
                                  SizedBox(
                                      height: 140.h,
                                      width: 148.w,
                                      child: Image.network(
                                        _categories[index].image,
                                        fit: BoxFit.fill,
                                      )),
                                  Align(
                                    alignment: AlignmentDirectional.bottomStart,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 8.w,bottom: 18.h),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(.6),),
                                      height: 35.h,
                                      width: 81.w,

                                  //    padding: EdgeInsets.all(5.w),
                                      child: Center(
                                        child: Row(

                                          children: [
                                            SizedBox(width: 10.w,),
                                            Image.asset("image/Group 19085.png",color: Colors.white,),
                                            SizedBox(width: 5.w,),
                                            Text(_categories[index].eventsCount.toString()+" Events",style: TextStyle(fontSize: 11.sp,color: Colors.white),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              _categories[index].nameEn,
                              style: TextStyle(fontSize: 10.sp),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
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
