import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:world_of_mouth/widgets/my_flutter_app_icons.dart';

class HeaderWidget extends StatefulWidget implements PreferredSizeWidget {
  final double _prefferedHeight = 200;
  final Function setNewState;

  const HeaderWidget({this.setNewState});

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

enum FeedType { MyExperts, Other }

class _HeaderWidgetState extends State<HeaderWidget> {
  
  FeedType _feedType = FeedType.MyExperts;  
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Container(color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Feed",
                style: TextStyle(fontSize: 38),
              ),
            ),
            Container(
              height: 60,
              decoration:
                  BoxDecoration(border: Border.all(color: HexColor("#C1C0C5"))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    onPressed: () {
                      widget.setNewState(FeedType.MyExperts);
                      setState(() {
                        _feedType = FeedType.MyExperts;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          MyFlutterApp.group_8,
                          color: _feedType == FeedType.MyExperts
                              ? Theme.of(context).buttonColor
                              : HexColor("#8A8A8F"),
                        ),
                        Text("Your Experts",
                            style: TextStyle(
                              color: _feedType == FeedType.MyExperts
                                  ? Theme.of(context).buttonColor
                                  : HexColor("#8A8A8F"),fontFamily: "SFPro",fontSize: 10
                            ))
                      ],
                    ),
                  ),
                  Container(
                      height: 60,
                      child: VerticalDivider(color: HexColor("#C1C0C5"))),
                  FlatButton(
                    onPressed: () {
                      widget.setNewState(FeedType.Other);
                      setState(() {
                        _feedType = FeedType.Other;
                      });
                      
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          CupertinoIcons.person_3,
                          color: _feedType == FeedType.Other
                              ? Theme.of(context).buttonColor
                              : HexColor("#8A8A8F"),
                        ),
                        Text("Other Experts",
                            style: TextStyle(
                              color: _feedType == FeedType.Other
                                  ? Theme.of(context).buttonColor
                                  : HexColor("#8A8A8F"), fontFamily: "SFPro", fontSize: 10
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
