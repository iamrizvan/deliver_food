import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants.dart';
import 'details_screen.dart';
import './widget/food_card.dart';
import './widget/category_title.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        textTheme: TextTheme(
            headline: TextStyle(fontWeight: FontWeight.bold),
            button: TextStyle(fontWeight: FontWeight.bold),
            title: TextStyle(fontWeight: FontWeight.bold),
            body1:TextStyle(color:kTextColor)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:Container(
        padding: EdgeInsets.all(10),
        height: 60,
        width:60,
        decoration:BoxDecoration(
          shape:BoxShape.circle,
          color:kPrimaryColor.withOpacity(0.26)
        ),
        child: Container(
          padding: EdgeInsets.all(15),
           height: 50,
           width:50,
        decoration:BoxDecoration(
          shape:BoxShape.circle,
          color:kPrimaryColor
        ),
        child: SvgPicture.asset("assets/icons/plus.svg"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 50),
              child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  "assets/icons/menu.svg",
                  height: 11,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("Simple way to find \ntasty food",
                  style: Theme.of(context).textTheme.headline),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  CategoryTitle(
                    title: "All",
                    isActive: false,
                  ),
                  CategoryTitle(
                    title: "Italian",
                    isActive: false,
                  ),
                  CategoryTitle(
                    title: "Chinese",
                    isActive: false,
                  ),
                  CategoryTitle(
                    title: "Arabic",
                    isActive: true,
                  ),
                  CategoryTitle(
                    title: "Indian",
                    isActive: false,
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kBorderColor)),
              child: SvgPicture.asset("assets/icons/search.svg"),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                   FoodCard(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return DetailsScreen();
                      }),
                    );
                  },
                  title: "Vegan salad bowl",
                  image: "assets/images/image_1.png",
                  price: 20,
                  calories: "420Kcal",
                  description:
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                ),
                FoodCard(
                  press: () {},
                  title: "Vegan salad bowl",
                  image: "assets/images/image_2.png",
                  price: 20,
                  calories: "420Kcal",
                  description:
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                ),
                  SizedBox(
                    width: 60,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

