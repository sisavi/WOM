import 'package:flutter/material.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget title;
  final double _prefferedHeight = 56;

  const SignUpAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "Back",
            style: TextStyle(
                color: Theme.of(context).buttonColor,
                fontSize: 16,
                fontFamily: "SFPro",
                fontWeight: FontWeight.w500),
          ),
        ),
        title: title,
        elevation: 0,
      );
  }

  @override
  
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}