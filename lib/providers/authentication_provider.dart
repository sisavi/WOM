import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:world_of_mouth/dummy_data.dart';
import 'package:world_of_mouth/providers/user.dart';

class AuthenticationProvider with ChangeNotifier {
  String _userId;
  User _user;
  String _email;
  String _password;

  String login(String email, String password) {
    for (var user in DUMMY_USERS) {
      if (user.email == email && user.password == password) {
        
        _userId = user.id;
        _user = DUMMY_USERS.firstWhere((element) => element.id == user.id);
      
        notifyListeners();
        return _userId;
      }
    }
    

    return null;
  }

  String get userId {
    return _userId;
  }

  User get user {
    return _user;
  }

  String get email {
    return _email;
  }

  String get password {
    return _password;
  }

  void registerStepOne(email, password) {
    
    _email = email;
    _password = password;
    
    notifyListeners();
  }

  bool register({
    String password,
    String email,
    String fullName,
    String expertise,
    String description,
    File imageFile,
    String homeCity,
  }) {
    var uuid = Uuid().v1().toString();
    if (!checkEmail(email)) {
      User user = User(
          id: uuid,
          password: _password,
          email: _email,
          fullName: fullName,
          expertise: expertise,
          description: description,
          avatarUrl: null,
          homeCity: homeCity,
          following: [],
          imageFile: imageFile);
      DUMMY_USERS.add(user);
      _userId = uuid;
      _user = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool checkEmail(String email) {
    bool exists = false;
    DUMMY_USERS.firstWhere(
        (element) => element.email == email ? exists = true : exists = false,
        orElse: () => null);

    return exists;
  }

  void addFollower(String userId){
    user.following.add(userId);
    notifyListeners();
  }
  void removeFollower(String userId){
    user.following.remove(userId);
    notifyListeners();
  }

  void logout() {
    _userId = null;
    _user = null;
    notifyListeners();
  }
}
