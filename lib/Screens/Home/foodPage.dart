import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:royalfoods/Screens/Food/favoriteFood.dart';
import 'package:royalfoods/Screens/UIs/Dimensions.dart';
import 'package:royalfoods/widgets/CustomButton.dart';
import 'package:royalfoods/widgets/IconsAndText.dart';
import 'package:royalfoods/widgets/MyText.dart';

class foodPage extends StatefulWidget {
  const foodPage({Key? key}) : super(key: key);

  @override
  State<foodPage> createState() => _foodPageState();
}

class _foodPageState extends State<foodPage> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //PageView section
        Container(
          height: 280,
          // color: Colors.blue,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, int) {
              return _foodPageItem(int);
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // indicator section
        new DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: Size(18.0, 9.0),
            activeColor: Colors.green,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // spacing: const EdgeInsets.all(10.0),
          ),
        ),
        // favorite food
        SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: MyText(
            title: 'Find Your Favorite Food',
            color: Colors.white,
            weight: FontWeight.w700,
            size: 18,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // list of food and images
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => favoriteFood(),
              ),
            );
          },
          child: Container(
            height: 700,
            child: ListView.builder(
                //shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.red,
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        //image container
                        Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white38,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/food1.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // text container
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                MyText(
                                  title: 'Nutrious Vegy meal in Abeokuta',
                                  color: Colors.black,
                                  weight: FontWeight.w600,
                                  size: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconsAndText(
                                        icon: Icons.circle,
                                        text: 'Normal',
                                        color: Colors.green,
                                        iconColor:
                                            Colors.orange.withOpacity(0.3),
                                        weight: FontWeight.w500,
                                        size: 15),
                                    IconsAndText(
                                        icon: Icons.location_on_outlined,
                                        text: '1.7km',
                                        color: Colors.green,
                                        iconColor: Colors.green,
                                        weight: FontWeight.w500,
                                        size: 15),
                                    IconsAndText(
                                        icon: Icons.access_time,
                                        text: '32mins',
                                        color: Colors.green,
                                        iconColor: Colors.red,
                                        weight: FontWeight.w500,
                                        size: 15),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }

// page view body
  Widget _foodPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: CustomButton(
              height: Dimensions.pageViewContainer,
              width: 350,
              color: index.isEven ? Colors.black : Colors.red,
              image: Image.asset(
                'assets/images/food1.jpg',
                fit: BoxFit.fill,
              ),
              Shadowcolor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 150,
            ),
            child: CustomButton(
              height: Dimensions.pageViewTextContainer,
              width: 300,
              color: Colors.white,
              Shadowcolor: Colors.grey,
              image: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  MyText(
                    title: 'DELICIOUS VEGY RICE',
                    color: Colors.black,
                    weight: FontWeight.w600,
                    size: 16,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyText(
                        title: '4.5',
                        color: Colors.black,
                        weight: FontWeight.w600,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyText(
                        title: '500 comments',
                        color: Colors.black,
                        weight: FontWeight.w600,
                        size: 15,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      IconsAndText(
                          icon: Icons.circle,
                          text: 'Normal',
                          color: Colors.black,
                          iconColor: Colors.orange.withOpacity(0.3),
                          weight: FontWeight.w500,
                          size: 15),
                      SizedBox(
                        width: 10,
                      ),
                      IconsAndText(
                          icon: Icons.location_on_outlined,
                          text: '1.7km',
                          color: Colors.black,
                          iconColor: Colors.green,
                          weight: FontWeight.w500,
                          size: 15),
                      SizedBox(
                        width: 10,
                      ),
                      IconsAndText(
                          icon: Icons.access_time,
                          text: '32mins',
                          color: Colors.black,
                          iconColor: Colors.red,
                          weight: FontWeight.w500,
                          size: 15),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
