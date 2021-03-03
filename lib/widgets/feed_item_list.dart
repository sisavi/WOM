import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:world_of_mouth/widgets/feed_item.dart';
import '../models/feed_item.dart' as fi;

class FeedItemList extends StatelessWidget {
  
  final List<fi.FeedItem> feedList;

  const FeedItemList({this.feedList});
  @override
  Widget build(BuildContext context) {
 

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
      color: HexColor("#C1C0C5"),
        ),
        //padding: const EdgeInsets.all(10.0),
        itemCount: feedList.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(value: feedList[i], child: FeedItem()) 
         
        
      ),
    );
  }
}
