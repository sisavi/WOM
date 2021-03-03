import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import './authentication_screen.dart';

class LandingScreen extends StatelessWidget {
    static final String routeName = "/landing";

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius:deviceSize.width / 2.5 ,
              backgroundImage: AssetImage(
                "assets/pictures/landingPage.png",
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to The",
                  style: TextStyle(color: HexColor("#9B9B9B"), fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                Text.rich(TextSpan(
                    text: "World ",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: "TimesNewRoman",
                    ),
                    children: [
                      TextSpan(
                          text: "of",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: "TimesNewRoman",
                              fontStyle: FontStyle.italic)),
                      TextSpan(
                          text: " Mouth",
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: "TimesNewRoman",
                          ))
                    ])),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          color: HexColor("#C1C0C5"),
        ))),
        child: SizedBox(
          height: deviceSize.height / 8,
          child: BottomAppBar(
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonTheme(
                  minWidth: deviceSize.width / 2.3,
                  height: deviceSize.height / 15,
                  child: Row(
                    children: [
                      FlatButton(
                        
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            side: BorderSide(
                              width: 1,
                              color: HexColor("#9B9B9B"),
                            )),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              AuthenticationScreen.routeName,
                              arguments: AuthMode.Login);
                        },
                        color: Colors.white,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: HexColor("#111111"),
                            fontFamily: "SFPro",
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              AuthenticationScreen.routeName,
                              arguments: AuthMode.Signup);
                        },
                        color: Theme.of(context).buttonColor,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "SFPro"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
