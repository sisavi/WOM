import 'package:flutter/cupertino.dart';

class FeedItem with ChangeNotifier {
  final String userId;
  final String id;
  final String imageUrl;
  final String title;
  final String locaton;

  FeedItem({this.id, this.userId, this.imageUrl, this.title, this.locaton});
}