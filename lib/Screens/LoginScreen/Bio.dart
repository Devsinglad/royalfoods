import 'package:flutter/material.dart';
import 'package:royalfoods/Screens/LoginScreen/Payment.dart';
import 'package:royalfoods/widgets/CustomBackground.dart';
import 'package:royalfoods/widgets/CustomButton.dart';
import 'package:royalfoods/widgets/MyText.dart';
import 'package:royalfoods/widgets/forms.dart';

class Bio extends StatefulWidget {
  const Bio({Key? key}) : super(key: key);

  @override
  State<Bio> createState() => _BioState();
}

class _BioState extends State<Bio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                customBackgroung(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 70,
                  ),
                  child: CustomButton(
                    height: 45,
                    width: 50,
                    image: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.deepOrange,
                        size: 40,
                      ),
                    ),
                    color: Colors.deepOrange.withOpacity(0.2),
                    Shadowcolor: Colors.transparent,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: MyText(
                title: 'Fill in your bio to get Started',
                color: Colors.white,
                weight: FontWeight.w600,
                size: 24,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: MyText(
                title:
                    'This data will be displayed in your account\nprofile for security',
                color: Colors.white,
                weight: FontWeight.w500,
                size: 15,
              ),
            ),
            form(
              title: 'First Name',
            ),
            form(
              title: 'Last Name',
            ),
            form(
              title: 'Mobile Number',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Payment(),
                  ),
                );
              },
              child: CustomButton(
                height: 57,
                width: 157,
                color: Colors.green,
                title: 'Next',
                Shadowcolor: Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
