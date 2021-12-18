import 'package:flutter/material.dart';
import 'package:hakathon_redy/prefs/shared_pref_controller.dart';
import 'package:hexcolor/hexcolor.dart';
class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  _LunchScreenState createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    String root=SharedPrefController().loggedIn?'/category_screen':'/login_screen';
    Future.delayed(const Duration(seconds: 3), () {
      // String route = SharedPrefController().loggedIn
      //     ? '/categories_screen'
      //     : '/login_screen';
      Navigator.pushReplacementNamed(context, root);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#253975"),
      body: Container(
          alignment: Alignment.center,
          child: Image.asset("image/UCAS Events.png",color: Colors.white,)
      ),
    );
  }
}
