import 'dart:io';

import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String id;
  final String password;
  final String email;
  final String expertise;
  final String description;
  final String avatarUrl;
  final String fullName;
  final String homeCity;
  List<String> following = [];
  File imageFile;

  User({
    this.id,
    this.fullName,
    this.password,
    this.email,
    this.expertise,
    this.description,
    this.avatarUrl,
    this.following,
    this.homeCity,
    this.imageFile
  });

  void addFollowing(String userId) {
    following.add(userId);
    notifyListeners();
  }

  void removeFollowing(String userId) {
    following.removeWhere((element) => element == userId);
    notifyListeners();
  }

  void removeFollowingWithUserId(String appUserId, String userId){

  }

  @override
  String toString() {
    return "${this.id} - ${this.fullName}- ${this.email} - ${this.password} -${this.expertise} -${this.description} - ${this.following}";
  }
}
