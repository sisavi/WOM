import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_of_mouth/providers/authentication_provider.dart';
import 'package:world_of_mouth/providers/destination_provider.dart';
import 'package:world_of_mouth/providers/feed_item_provider.dart';
import 'package:world_of_mouth/providers/user_provider.dart';
import 'package:world_of_mouth/screens/authentication_screen.dart';
import 'package:world_of_mouth/screens/feed_screen.dart';
import 'package:world_of_mouth/screens/profile_screen.dart';
import 'package:world_of_mouth/screens/signup_screen.dart';
import './screens/landing_screen.dart';
import 'package:hexcolor/hexcolor.dart';

import 'providers/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color buttoncolor = const Color(0x0239D0);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthenticationProvider(),
        ),
        ChangeNotifierProxyProvider<AuthenticationProvider, User>(
          create: null,
          update: (ctx, authentication, user) => User(
            id: authentication.userId,
            email: authentication.user.email,
            expertise: authentication.user.expertise,
            password: authentication.user.password,
            description: authentication.user.description,
            avatarUrl: authentication.user.avatarUrl,
            following: authentication.user.following,
            homeCity: authentication.user.homeCity,
            fullName: authentication.user.fullName,
            imageFile: authentication.user.imageFile,
          ),
        ),
        ChangeNotifierProxyProvider<AuthenticationProvider, Feed>(
          create: (_) => null,
          update: (ctx, auth, feed) => Feed(auth.userId),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Destination(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: HexColor("#F2F2F2"),
          buttonColor: HexColor("#0239D0"),          
          fontFamily: "GTSuper",
          backgroundColor: Colors.white,
        ),
        home: LandingScreen(),
        routes: {
          AuthenticationScreen.routeName: (ctx) => AuthenticationScreen(),
          FeedScreen.routeName: (ctx) => FeedScreen(),
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          LandingScreen.routeName: (ctx) => LandingScreen(),
        },
      ),
    );
  }
}
