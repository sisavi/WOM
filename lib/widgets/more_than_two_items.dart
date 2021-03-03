import 'package:flutter/material.dart';
import 'package:world_of_mouth/models/feed_item.dart';
import 'package:world_of_mouth/widgets/feed_item_list.dart';
import 'package:world_of_mouth/widgets/recommendation_box.dart';
import 'package:world_of_mouth/widgets/suggested_experts_carouselle.dart';

class MoreThanTwoItems extends StatelessWidget {
  final List<FeedItem> feedList;

  const MoreThanTwoItems({this.feedList});
  @override
  Widget build(BuildContext context) {
        return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FeedItemList(feedList: feedList.sublist(0, 2),),
                SuggestedExpertsCarouselle(),
                FeedItemList(feedList: feedList.sublist(2)),
                RecommendationBox()
      ],
    );
  }
}
