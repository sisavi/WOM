import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:world_of_mouth/providers/user.dart';
import 'package:world_of_mouth/screens/landing_screen.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "profile";

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
   
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: deviceSize.height / 6,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Profile",
              style: TextStyle(
                  color: HexColor("#111111"),
                  fontFamily: "GTSuper",
                  fontSize: 38,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        body: Container(color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: user.avatarUrl == null
                            ? FileImage(user.imageFile)
                            : NetworkImage(
                                user.avatarUrl,
                              ),
                        radius: deviceSize.width / 4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(user.fullName,
                          style: TextStyle(
                              color: HexColor("#111111"),
                              fontFamily: "SFPro",
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  height: deviceSize.height / 17,
                  minWidth: deviceSize.width / 1.2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                  onPressed: () {
                    final act = CupertinoActionSheet(
                        title: Text(
                          'Would you like to log out?',
                          style: TextStyle(fontSize: 13),
                        ),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: Text(
                              'Yes',
                              style: TextStyle(color: HexColor("#2E2E2E")),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(LandingScreen.routeName);
                            },
                          )
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: Text(
                            'Cancel',
                            style:
                                TextStyle(color: Theme.of(context).buttonColor),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ));
                    showCupertinoModalPopup(
                        context: context, builder: (BuildContext context) => act);
                  },
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    "Log Out",
                    style: TextStyle(color: Colors.white, fontFamily: "SFPro"),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
