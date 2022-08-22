import 'package:flutter/material.dart';
import 'package:royalfoods/widgets/CustomButton.dart';
import 'package:royalfoods/widgets/MyText.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              MyText(
                title: 'Nigeria',
                color: Colors.green,
                weight: FontWeight.w600,
                size: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyText(
                    title: 'OGun',
                    color: Colors.grey,
                    weight: FontWeight.w500,
                    size: 16,
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 40,
                    color: Colors.orange.withOpacity(0.3),
                  ),
                ],
              ),
            ],
          ),
          CustomButton(
            height: 47,
            width: 47,
            color: Colors.green.withOpacity(0.7),
            image: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            Shadowcolor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
