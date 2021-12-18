import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:hakathon_redy/api/controllers/auth_api_controller.dart';
import 'package:hakathon_redy/helpers/helpers.dart';
import 'package:hakathon_redy/widgets/app_text_field.dart';
import 'package:hexcolor/hexcolor.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>with Helpers {
  late TextEditingController _userNametextEditingController;
  late TextEditingController _passwordtextEditingController;

  @override
  void initState() {
    _userNametextEditingController = TextEditingController();
    _passwordtextEditingController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _userNametextEditingController.dispose();
    _passwordtextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color2,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        children: [
          SizedBox(
            height: 50.h,
          ),
          Container(height: 237.h,width: 227.w,child: Image.asset("image/UCAS Events.png"),),
          SizedBox(
            height: 50.h,
          ),
          Text(
            "Welcome to back",
            style: TextStyle(
                 fontSize: 11.sp, ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Login with",
            style: TextStyle(
              fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Phone",
            style: TextStyle(fontSize: 12.sp,),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.person_outline,
            textEditingController: _userNametextEditingController,
            hint: "599999999",
            textInputType: TextInputType.phone,
            numper: 9,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Password",
            style: TextStyle(fontSize: 12.sp),
          ),
          SizedBox(
            height: 7.h,
          ),
          AppTextField(
            prefixIcon: Icons.lock_outline,
            textEditingController: _passwordtextEditingController,
            hint: "********",
            se: true,
          ),
          SizedBox(
            height: 79.h,
          ),

          ElevatedButton(
            // onPressed: (){
            //   Navigator.pushReplacementNamed(context, "/category_screen");
            // },
            onPressed: ()async => await performLogin(),
            child: Text(
              "Sign in",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,fontWeight: FontWeight.w700
              ),
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
  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_userNametextEditingController.text.isNotEmpty &&
        _passwordtextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(
      context,
      mobile: _userNametextEditingController.text,
      password: _passwordtextEditingController.text,
    );
    if (status){

      Navigator.pushReplacementNamed(context, '/category_screen');

    }
  }

}
