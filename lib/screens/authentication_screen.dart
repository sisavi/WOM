import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:world_of_mouth/providers/authentication_provider.dart';
import 'package:world_of_mouth/screens/feed_screen.dart';
import 'package:world_of_mouth/screens/signup_screen.dart';
import 'package:world_of_mouth/widgets/sign_up_appbar.dart';

enum AuthMode { Signup, Login }

class AuthenticationScreen extends StatefulWidget {
  static final String routeName = "/auth";
  final AuthMode authMode;

  const AuthenticationScreen({
    Key key,
    this.authMode,
  }) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  String _password;
  String _email;
  bool _emailIsValid = false;
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _obscureText = true;
  bool _agreed = false;
  FocusNode _emailFocus;
  FocusNode _passwordFocus;
  bool _emailError = false;
  bool _passwordError = false;

  @override
  void initState() {
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
    _emailController.addListener(() {
      _checkEmail();
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _toggleShowPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _checkEmail() {
    setState(() {
      _emailIsValid =
          Provider.of<AuthenticationProvider>(context, listen: false)
              .checkEmail(_emailController.value.text);
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  void _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    if (_authMode == AuthMode.Signup &&
        _agreed &&
        !_emailError &&
        !_passwordError) {
      _formKey.currentState.save();
      Provider.of<AuthenticationProvider>(context, listen: false)
          .registerStepOne(_email, _password);
      Navigator.pushNamed(
        context,
        SignUpScreen.routeName,
      );
      return;
    }

    if (_authMode == AuthMode.Login) {
      _formKey.currentState.save();
      var userId = Provider.of<AuthenticationProvider>(context, listen: false)
          .login(_email, _password);
      // Log user in
      if (userId != null) {
        Navigator.pushNamed(context, FeedScreen.routeName, arguments: userId);
      } else {
        _showErrorDialog("Password or Username wrong!");
      }
    } else {
      _showErrorDialog("Please accept terms and conditons");
      // Sign user up
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    setState(() {
      _authMode = ModalRoute.of(context).settings.arguments;
    });
    
    return Scaffold(
      appBar: SignUpAppBar(
          title: _authMode == AuthMode.Signup
              ? Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "1 of 2",
                    style: TextStyle(color: HexColor("#9B9B9B"), fontSize: 16),
                  ))
              : null),
      body: Container(
        color: Colors.white,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _authMode == AuthMode.Login
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 38,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : Text("Sign Up",
                      style: TextStyle(
                          fontSize: 38,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          border: _emailFocus.hasFocus
                              ? Border.all(color: Theme.of(context).buttonColor)
                              : Border.all(color: Colors.white)),
                      child: TextFormField(
                        focusNode: _emailFocus,
                        maxLines: 1,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              _emailIsValid
                                  ? CupertinoIcons.check_mark_circled_solid
                                  : CupertinoIcons.check_mark_circled,
                              color: _emailIsValid
                                  ? Theme.of(context).buttonColor
                                  : HexColor("#C7CCD0"),
                            ),
                            border: InputBorder.none,
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(color: HexColor("#C7CCD0")),
                            filled: true,
                            fillColor: HexColor("#F9F9F9")),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            setState(() {
                              _emailError = true;
                            });
                            return;
                          }
                          setState(() {
                            _emailError = false;
                          });
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                    ),
                    if (_emailError)
                      Text(
                        "invalid Email!",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    SizedBox(
                      height: deviceSize.height / 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          border: _passwordFocus.hasFocus
                              ? Border.all(color: Theme.of(context).buttonColor)
                              : Border.all(color: Colors.white)),
                      child: TextFormField(
                        focusNode: _passwordFocus,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: HexColor("#C7CCD0"),
                            ),
                            onPressed: (_toggleShowPassword),
                          ),
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(color: HexColor("#C7CCD0")),
                          filled: true,
                          fillColor: HexColor("#F9F9F9"),
                        ),
                        obscureText: _obscureText,
                        controller: _passwordController,
                        validator: (value) {
                          if (value.isEmpty || value.length < 5) {
                            setState(() {
                              _passwordError = true;
                            });
                            return;
                          }
                          setState(() {
                            _passwordError = false;
                          });
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                    ),
                    if (_passwordError)
                      Text(
                        "invalid Password!",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    if (_authMode == AuthMode.Signup)
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                focusColor: Colors.lightBlue,
                                activeColor: Theme.of(context).buttonColor,
                                value: _agreed,
                                onChanged: (newValue) {
                                  setState(() => _agreed = newValue);
                                }),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(
                                    text: "I agree to The World of Mouth ",
                                    style: TextStyle(
                                      fontFamily: "SFPro",
                                      fontSize: 12,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Terms and Conditions",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).buttonColor),
                                      )
                                    ])),
                                Text.rich(TextSpan(
                                    text: "and ",
                                    style: TextStyle(
                                      fontFamily: "SFPro",
                                      fontSize: 12,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Privacy Policy",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).buttonColor),
                                      )
                                    ]))
                              ],
                            ),
                          ]),
                  ],
                ),
              ),
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: deviceSize.height / 8,
              width: deviceSize.width,
              decoration: BoxDecoration(
                color: HexColor("#F8F8F8"),
                border: Border(
                  top: BorderSide(
                    color: HexColor("#C1C0C5"),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FlatButton(
                  height: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                  onPressed: _submit,
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontFamily: "SFPro"),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
