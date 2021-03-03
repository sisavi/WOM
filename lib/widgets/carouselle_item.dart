import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:world_of_mouth/providers/authentication_provider.dart';
import 'package:world_of_mouth/providers/user.dart';

class CarouselleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final User user = Provider.of<User>(context, listen: false);
    final User appUser =
        Provider.of<AuthenticationProvider>(context, listen: false).user;
    
    return Container(
      decoration: BoxDecoration(boxShadow: [
        new BoxShadow(
          color: HexColor("#8E8E93").withOpacity(.2),
          blurRadius: 8.0,
          spreadRadius: -2,
          offset: Offset(2, 4),
        ),
      ]),
      child: SizedBox(
        width: deviceSize.width / 2.3,
        height: deviceSize.height / 3,
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).buttonColor,
                  radius: 35,
                  child: CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: user.avatarUrl == null
                          ? FileImage(user.imageFile)
                          : NetworkImage(
                              user.avatarUrl,
                            ),
                      radius: 30,
                    ),
                  ),
                ),
              ),
              Text(
                user.fullName,
                style: TextStyle(
                    fontFamily: "SFPro",
                    fontSize: 12,
                    color: HexColor("#4A4A4A")),
              ),
              Text(user.expertise,
                  style: TextStyle(
                      fontFamily: "SFPro",
                      fontSize: 12,
                      color: HexColor("#8E8E93"))),
              appUser.following.contains(user.id)
                  ? Consumer<User>(
                      builder: (ctx, user, _) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                          onPressed: () {
                            Provider.of<AuthenticationProvider>(context,
                                    listen: false)
                                .removeFollower(user.id);
                          },
                          color: Theme.of(context).buttonColor,
                          child: Text(
                            "Following",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "SFPro",
                                fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  : Consumer<User>(
                      builder: (ctx, user, _) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              side: BorderSide(
                                width: 1,
                                color: HexColor("#8E8E93"),
                              )),
                          onPressed: () {
                            Provider.of<AuthenticationProvider>(context,
                                    listen: false)
                                .addFollower(user.id);
                          },
                          color: Colors.white,
                          child: Text(
                            "Follow",
                            style: TextStyle(
                                color: HexColor("#8E8E93"),
                                fontFamily: "SFPro",
                                fontSize: 12),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
