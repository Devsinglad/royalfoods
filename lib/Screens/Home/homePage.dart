import 'package:flutter/material.dart';
import 'package:royalfoods/Screens/Home/foodPage.dart';
import 'package:royalfoods/widgets/home%20Header.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    print('curren size' + MediaQuery.of(context).size.height.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Header(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: foodPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
