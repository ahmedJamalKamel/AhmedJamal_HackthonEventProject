import 'package:flutter/material.dart';


class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.textEditingController,
    required this.hint,
    required this.prefixIcon,
    this.textInputType = TextInputType.name,
    this.se=false,
    this.ticket=true,
    this.color,
    this.line=1,
    this.numper=100,
    this.secere=false
  }) : super(key: key);
  final int line;
  final TextEditingController textEditingController;
  final String hint;
  final IconData prefixIcon;
  final TextInputType textInputType;
  final bool se;
  final bool ticket;
  final Color? color;
  final int numper;
  final bool secere;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText:se ,
      maxLines:ticket?1:line,
      maxLength: numper,

      decoration:ticket?
      InputDecoration(
          hintText: hint,
          counterText: "",
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.5)),
          prefixIcon: ticket?Icon(prefixIcon,color: color,):SizedBox(),
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(color: Colors.blue)
      ):
      InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.5)),
          prefixIcon: ticket?Icon(prefixIcon,color: color,):SizedBox(),
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(color: Colors.blue)
      ),
    );
  }

  OutlineInputBorder outlineBorder({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderSide:  BorderSide(
        width: 1,
        color: color,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
