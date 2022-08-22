import 'package:flutter/material.dart';
import 'package:royalfoods/Screens/LoginScreen/Upload.dart';
import 'package:royalfoods/widgets/CustomBackground.dart';
import 'package:royalfoods/widgets/CustomButton.dart';
import 'package:royalfoods/widgets/MyText.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyText(
                  title: 'Payment Method',
                  color: Colors.white,
                  weight: FontWeight.w600,
                  size: 16,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyText(
                    title:
                        'This data will be displayed in your account\nprofile for security',
                    color: Colors.white,
                    weight: FontWeight.w400,
                    size: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: CustomButton(
                height: 70,
                width: 400,
                color: Colors.white10,
                image: Text(
                  'VISA',
                  style: TextStyle(
                      letterSpacing: 10,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 30,
                      fontStyle: FontStyle.italic),
                ),
                Shadowcolor: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Upload(),
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
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
