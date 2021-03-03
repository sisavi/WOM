import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:world_of_mouth/providers/authentication_provider.dart';
import 'package:world_of_mouth/screens/feed_screen.dart';
import 'package:world_of_mouth/widgets/image_input.dart';
import 'package:world_of_mouth/widgets/sign_up_appbar.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "sign-up2";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _nameController = TextEditingController();
  final _expertiseController = TextEditingController();
  final _homeCityController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _twitterController = TextEditingController();
  String fullName;
  String homeCity;
  String description;
  String expertise;
  String twitter;
  String email;
  String password;
  FocusNode _fullNameFocus;
  FocusNode _homeCityFocus;
  FocusNode _descriptionFocus;
  FocusNode _expertiseFocus;
  FocusNode _twitterFocus;
  bool _fullNameError = false;
  bool _homeCityError = false;
  bool _descriptionError = false;
  bool _expertiseError = false;

  File _pickedImage;

  void _saveProfileInfo() {
    if (_formKey.currentState.validate() &&
        _pickedImage != null &&
        !_fullNameError &&
        !_homeCityError &&
        !_descriptionError &&
        !_expertiseError) {
      _formKey.currentState.save();

      

      Provider.of<AuthenticationProvider>(context, listen: false).register(
          email: email,
          password: password,
          fullName: fullName,
          expertise: expertise,
          homeCity: homeCity,
          description: description,
          imageFile: _pickedImage);

      Navigator.pushReplacementNamed(
        context,
        FeedScreen.routeName,
      );
    }
  }

  @override
  void initState() {
    _fullNameFocus = FocusNode();
    _homeCityFocus = FocusNode();
    _descriptionFocus = FocusNode();
    _expertiseFocus = FocusNode();
    _twitterFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _fullNameFocus.dispose();
    _homeCityFocus.dispose();
    _descriptionFocus.dispose();
    _expertiseFocus.dispose();
    _twitterFocus.dispose();
    super.dispose();
  }

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    email = Provider.of<AuthenticationProvider>(context).email;
    password = Provider.of<AuthenticationProvider>(context).password;

    return Scaffold(
        appBar: SignUpAppBar(
          title: Align(
              alignment: Alignment.topRight,
              child: Text(
                "2 of 2",
                style: TextStyle(color: HexColor("#9B9B9B"), fontSize: 16),
              )),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Can you tell us a little bit more about yourself?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "SFPro",
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: ImageInput(_selectImage),
                ),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          border: _fullNameFocus.hasFocus
                              ? Border.all(color: Theme.of(context).buttonColor)
                              : Border.all(color: Colors.white)),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            _fullNameFocus.requestFocus();
                          });
                        },
                        onEditingComplete: () {
                          setState(() {
                            _fullNameFocus.unfocus();
                          });
                        },
                        focusNode: _fullNameFocus,
                        maxLines: 1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'FULL NAME',
                            labelStyle: TextStyle(color: HexColor("#C7CCD0")),
                            filled: true,
                            fillColor: HexColor("#F9F9F9")),
                        keyboardType: TextInputType.emailAddress,
                        controller: _nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              _fullNameError = true;
                            });
                            return;
                          }
                          setState(() {
                            _fullNameError = false;
                          });
                        },
                        onSaved: (value) {
                          fullName = value;
                        },
                      ),
                    ),
                    if (_fullNameError) Text("Please Enter Full Name!",style: TextStyle(
                          color: Colors.red,
                        ),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          border: _homeCityFocus.hasFocus
                              ? Border.all(color: Theme.of(context).buttonColor)
                              : Border.all(color: Colors.white)),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            _homeCityFocus.requestFocus();
                          });
                        },
                        onEditingComplete: () {
                          setState(() {
                            _homeCityFocus.unfocus();
                          });
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'HOME CITY',
                            labelStyle: TextStyle(color: HexColor("#C7CCD0")),
                            filled: true,
                            fillColor: HexColor("#F9F9F9")),
                        controller: _homeCityController,
                        focusNode: _homeCityFocus,
                        validator: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              _homeCityError = true;
                            });
                            return;
                          }
                          setState(() {
                            _homeCityError = false;
                          });
                        },
                        onSaved: (value) {
                          homeCity = value;
                        },
                      ),
                    ),
                    if (_homeCityError) Text("Please Enter Home City!",style: TextStyle(
                          color: Colors.red,
                        ),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          border: _expertiseFocus.hasFocus
                              ? Border.all(color: Theme.of(context).buttonColor)
                              : Border.all(color: Colors.white)),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            _expertiseFocus.requestFocus();
                          });
                        },
                        onEditingComplete: () {
                          setState(() {
                            _expertiseFocus.unfocus();
                          });
                        },
                        focusNode: _expertiseFocus,
                        maxLines: 1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'EXPERTISE TITLE',
                            labelStyle: TextStyle(color: HexColor("#C7CCD0")),
                            filled: true,
                            fillColor: HexColor("#F9F9F9")),
                        controller: _expertiseController,
                        validator: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              _expertiseError = true;
                            });
                            return;
                          }
                          setState(() {
                            _expertiseError = false;
                          });
                        },
                        onSaved: (value) {
                          expertise = value;
                        },
                      ),
                    ),
                    if (_expertiseError) Text("Please Enter Expertise!",style: TextStyle(
                          color: Colors.red,
                        ),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          border: _descriptionFocus.hasFocus
                              ? Border.all(color: Theme.of(context).buttonColor)
                              : Border.all(color: Colors.white)),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            _descriptionFocus.requestFocus();
                          });
                        },
                        onEditingComplete: () {
                          setState(() {
                            _descriptionFocus.unfocus();
                          });
                        },
                        focusNode: _descriptionFocus,
                        maxLines: 3,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'SHORT DESCRIPTION',
                            labelStyle: TextStyle(color: HexColor("#C7CCD0")),
                            filled: true,
                            fillColor: HexColor("#F9F9F9")),
                        controller: _descriptionController,
                        validator: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              _descriptionError = true;
                            });
                            return;
                          }
                          setState(() {
                            _descriptionError = false;
                          });
                        },
                        onSaved: (value) {
                          description = value;
                        },
                      ),
                    ),
                    if (_descriptionError) Text("Please Enter Description!",style: TextStyle(
                          color: Colors.red,
                        ),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          border: _twitterFocus.hasFocus
                              ? Border.all(color: Theme.of(context).buttonColor)
                              : Border.all(color: Colors.white)),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            _twitterFocus.requestFocus();
                          });
                        },
                        onEditingComplete: () {
                          setState(() {
                            _twitterFocus.unfocus();
                          });
                        },
                        focusNode: _twitterFocus,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'TWITTER LINK',
                            labelStyle: TextStyle(color: HexColor("#C7CCD0")),
                            filled: true,
                            fillColor: HexColor("#F9F9F9")),
                        controller: _twitterController,
                        onSaved: (value) {
                          twitter = value;
                        },
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: HexColor("#C1C0C5"),
          ))),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FlatButton(
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              onPressed: () {
                _saveProfileInfo();
              },
              color: Theme.of(context).buttonColor,
              child: Text(
                "Next",
                style: TextStyle(color: Colors.white, fontFamily: "SFPro"),
              ),
            ),
          ),
        ));
  }
}
