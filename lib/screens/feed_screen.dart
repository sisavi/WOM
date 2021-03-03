import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_of_mouth/providers/feed_item_provider.dart';
import 'package:world_of_mouth/screens/profile_screen.dart';
import 'package:world_of_mouth/widgets/destination_carouselle.dart';
import 'package:world_of_mouth/widgets/feed_item_list.dart';
import 'package:world_of_mouth/widgets/header_widget.dart';
import 'package:world_of_mouth/widgets/recommendation_box.dart';
import 'package:world_of_mouth/widgets/suggested_experts_carouselle.dart';
import '../models/feed_item.dart' as fi;

class FeedScreen extends StatefulWidget {
  static final String routeName = "/feed";

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  FeedType feedType = FeedType.MyExperts;
  @override
  void didChangeDependencies() {
    Provider.of<Feed>(context).loadFeed(feedType);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<fi.FeedItem> feedList = Provider.of<Feed>(context).feedItems;
    setFeedType(FeedType type) {
      setState(() {
        feedType = type;
        feedList = Provider.of<Feed>(context, listen: false).loadFeed(feedType);
      });
    }

    return Scaffold(
      appBar: HeaderWidget(setNewState: setFeedType),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: feedList.length >= 3
            ? ListView(padding: EdgeInsets.zero, children: [
                FeedItemList(feedList: feedList.sublist(0, 2)),
                SuggestedExpertsCarouselle(),
                FeedItemList(feedList: feedList.sublist(2)),
                DestinationCarouselle(),
                RecommendationBox(),
              ])
            : ListView(
                padding: EdgeInsets.zero,
                children: [
                  FeedItemList(feedList: feedList),
                  SuggestedExpertsCarouselle(),
                  DestinationCarouselle(),
                  RecommendationBox()
                ],
              ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
              icon: Icon(CupertinoIcons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(CupertinoIcons.globe),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(CupertinoIcons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(CupertinoIcons.person),
              onPressed: () {
                Navigator.of(context).pushNamed(ProfileScreen.routeName);
              },
            ),
          ]),
        ),
      ),
    );
  }
}
