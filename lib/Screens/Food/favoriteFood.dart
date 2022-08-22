import 'package:flutter/material.dart';
import 'package:royalfoods/Screens/UIs/Dimensions.dart';
import 'package:royalfoods/widgets/CustomButton.dart';
import 'package:royalfoods/widgets/MyText.dart';

class favoriteFood extends StatelessWidget {
  const favoriteFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.favoriteImageSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/food1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: CustomButton(
                    height: 47,
                    width: 47,
                    color: Colors.deepOrange.withOpacity(0.5),
                    Shadowcolor: Colors.transparent,
                    image: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.green,
                      size: Dimensions.IconSize,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: CustomButton(
                    height: 47,
                    width: 47,
                    color: Colors.deepOrange.withOpacity(0.5),
                    Shadowcolor: Colors.transparent,
                    image: Icon(
                      Icons.shopping_cart,
                      color: Colors.green,
                      size: Dimensions.IconSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.favoriteImageSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: MyText(
                title: 'NO Info',
                color: Colors.green,
                size: 24,
                weight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeight,
        padding: EdgeInsets.only(
          top: 30,
          bottom: 30,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20 * 2),
            topRight: Radius.circular(20 * 2),
          ),
          color: Colors.grey.shade300,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove),
                  SizedBox(
                    width: 4,
                  ),
                  MyText(
                    title: '0',
                    color: Colors.black,
                    weight: FontWeight.w600,
                    size: 15,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(Icons.add),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: MyText(
                title: '\$10 | Add to cart',
                size: 16,
                color: Colors.white,
                weight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
