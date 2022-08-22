import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:royalfoods/Screens/LoginScreen/Bio.dart';
import 'package:royalfoods/Screens/LoginScreen/LoginScreen.dart';
import 'package:royalfoods/widgets/Check.dart';
import 'package:royalfoods/widgets/CustomBackground.dart';
import 'package:royalfoods/widgets/MyText.dart';
import 'package:royalfoods/widgets/login%20widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _phoneNumberTextController = TextEditingController();
  bool isChecked = false;
  var auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            customBackgroung(),
            SizedBox(
              height: 20,
            ),
            MyText(
                title: 'Create Free Account',
                color: Colors.white,
                weight: FontWeight.w700,
                size: 18),
            SizedBox(
              height: 20,
            ),
            reuseuablefield(
              'Enter UserName',
              Icons.person,
              false,
              _userNameTextController,
            ),
            SizedBox(
              height: 20,
            ),
            reuseuablefield(
              'Phone Number',
              Icons.phone,
              false,
              _phoneNumberTextController,
            ),
            SizedBox(
              height: 20,
            ),
            reuseuablefield(
              'Enter Email',
              Icons.email_outlined,
              false,
              _emailTextController,
            ),
            SizedBox(
              height: 20,
            ),
            reuseuablefield(
              'Enter Password',
              Icons.lock_outline,
              true,
              _passwordTextController,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  check(),
                  SizedBox(
                    width: 10,
                  ),
                  MyText(
                      title: 'Keep Me Signed In',
                      color: Colors.white,
                      weight: FontWeight.w500,
                      size: 14)
                ],
              ),
            ),
            signinButton(context, false, () async {
              try {
                var instance = await auth
                    .createUserWithEmailAndPassword(
                  email: _emailTextController.text.toString().trim(),
                  password: _passwordTextController.text,
                )
                    // FirebaseAuth.instance.
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                });

                // print(instance.)
              } catch (e, s) {
                print(e);
                print(s);
              }
            }),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                );
              },
              child: MyText(
                  title: 'already have an account?',
                  color: Colors.green,
                  weight: FontWeight.w500,
                  size: 15),
            )
          ],
        ),
      ),
    );
  }
}

enum auth {
  emai,
  goggle,
  facebook,
}
