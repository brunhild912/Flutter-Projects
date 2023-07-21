// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, sized_box_for_whitespace, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/constants.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import 'chat_screen.dart';
import 'welcome_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showModalProgress = false;
  late String email;
  late String password;
  void logInUser() async {
    setState(() {
      showModalProgress = true;
    });
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        await Navigator.pushNamed(context, ChatScreen.id);
      }
      showModalProgress = false;
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showModalProgress,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                    keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email',
                  ),
                  cursorColor: kTextfieldBorderColor,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(

                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password',
                  ),
                  cursorColor: kTextfieldBorderColor,
                  obscureText: true,
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                    title: 'Login',
                    color: kRoundedButtonColor,
                    onPressed: (){
                      logInUser();
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}