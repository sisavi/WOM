import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:world_of_mouth/dummy_data.dart';
import 'package:world_of_mouth/providers/authentication_provider.dart';
import 'package:world_of_mouth/providers/user.dart';
import 'package:world_of_mouth/providers/user_provider.dart';
import 'package:world_of_mouth/widgets/overlapping_avatars_widget.dart';
import '../models/feed_item.dart' as fi;

class FeedItem extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final fi.FeedItem feedItem =
        Provider.of<fi.FeedItem>(context, listen: false);
    final String userId = Provider.of<AuthenticationProvider>(context).userId;
    

    final List<String> userFollowing = Provider.of<UserProvider>(context).userFollowing(userId);

    final User author =
        DUMMY_USERS.firstWhere((element) => element.id == feedItem.userId);
    
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(author.avatarUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            author.fullName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            author.expertise,
                            style: TextStyle(color: Colors.grey),
                          )
                        ]),
                  ),
                ],
              ),
              ButtonTheme(
                  minWidth: 100,
                  height: 25,
                  child: userFollowing.contains(author.id)
                      ? Consumer<fi.FeedItem>(
                          builder: (ctx, feedItem, _) => FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  side: BorderSide(
                                    width: 1,
                                    color: HexColor("#8E8E93"),
                                  )),
                              onPressed: () {
                                Provider.of<User>(context, listen: false)
                                    .removeFollowing(author.id);
                              },
                              color: Theme.of(context).buttonColor,
                              child: Text(
                                "following",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: "SFPro"),
                              )))
                      : Consumer<fi.FeedItem>(
                          builder: (ctx, feedItem, _) => FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                side: BorderSide(
                                  width: 1,
                                  color: HexColor("#8E8E93"),
                                )),
                            onPressed: () {Provider.of<User>(context, listen: false)
                                    .addFollowing(author.id);},
                            color: Colors.white,
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                  color: HexColor("#8E8E93"),
                                  fontFamily: "SFPro",
                                  fontSize: 12),
                            ),
                          ),
                        )),
            ],
          ),
          Container(
            decoration: BoxDecoration(),
            child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  feedItem.imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feedItem.title,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                Text(feedItem.locaton,
                    style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: "SFPro")),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              OverlappingAvatarsWidget(),
              VerticalDivider(
                width: 10,
              ),
              Text(
                "3 + 1 Recommendations",
                style:
                    TextStyle(color: Theme.of(context).buttonColor, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
