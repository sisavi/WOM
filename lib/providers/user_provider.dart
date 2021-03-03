import 'package:flutter/cupertino.dart';
import 'package:world_of_mouth/providers/user.dart';

import '../dummy_data.dart';


class UserProvider with ChangeNotifier {
 List<User> _users = [];

 List<User> suggestedExperts(String appUserId) {
   List<User> loadedUsers = [];

    List<String> userFollowing =
        DUMMY_USERS.firstWhere((element) => element.id == appUserId).following;

    
    loadedUsers.addAll(DUMMY_USERS.where((element) => !userFollowing.contains(element.id)));

    _users = loadedUsers;

    return _users;
  }

  List<String> userFollowing(String appUserId){

    List<String> userFollowing =
        DUMMY_USERS.firstWhere((element) => element.id == appUserId).following;


    return userFollowing;

  }

  

}