import 'package:flutter/material.dart';
import 'package:world_of_mouth/dummy_data.dart';
import 'package:world_of_mouth/models/feed_item.dart';
import 'package:world_of_mouth/widgets/header_widget.dart';

class Feed with ChangeNotifier {
  List<FeedItem> _feed = [];

  final String userId;

  Feed(this.userId);

  List<FeedItem> loadFeed(FeedType feedType) {
    
    feedType == FeedType.MyExperts
        ? feedMyExperts(userId)
        : feedOtherExperts(userId);

    return [..._feed];
  }

  void feedMyExperts(String appUserId) {
    List<FeedItem> userFeed = [];
    List<String> userFollowing =
        DUMMY_USERS.firstWhere((element) => element.id == appUserId).following;

    userFeed.addAll(
        FEED_ITEMS.where((element) => userFollowing.contains(element.userId)));
    
    _feed = userFeed;
  }

  get feedItems {
    return [..._feed];
  }

  List<FeedItem> feedOtherExperts(String appUserId) {
    List<FeedItem> userFeed = [];

    List<String> userFollowing =
        DUMMY_USERS.firstWhere((element) => element.id == appUserId).following;

    userFeed.addAll(
        FEED_ITEMS.where((element) => !userFollowing.contains(element.userId)));
  

    _feed = userFeed;

    return _feed;
  }
}
