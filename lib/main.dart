import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants.dart';
import 'details_screen.dart';

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
            title: TextStyle(fontWeight: FontWeight.bold)),
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

class FoodCard extends StatelessWidget {
  final String title;
  final String ingredient;
  final String image;
  final int price;
  final String calories;
  final String description;
  final Function press;

  const FoodCard({
    Key key,
    this.title,
    this.ingredient="",
    this.image,
    this.price,
    this.calories,
    this.description, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
          child: Container(
        margin: EdgeInsets.only(left: 10),
        height: 350,
        width: 220,
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 330,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    color: kPrimaryColor.withOpacity(0.06)),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 131,
                width: 131,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor.withOpacity(0.16)),
              ),
            ),
            Positioned(
                top: 0,
                left: -50,
                child: Container(
                  height: 134,
                  width: 226,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image)),
                  ),
                )),
            // Price
            Positioned(
              right: 20,
              top: 80,
              child: Text("\$$price",
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(color: kPrimaryColor)),
            ),
            Positioned(
                top: 201,
                left: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontSize: 16),
                    ),
                    Text(ingredient,
                        style: TextStyle(color: kTextColor.withOpacity(0.4))),
                    SizedBox(
                      height: 10,
                    ),
                    Text(description,
                        maxLines: 3,
                        style: TextStyle(color: kTextColor.withOpacity(0.65))),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$calories Kcal",
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final String title;
  final bool isActive;
  const CategoryTitle({
    Key key,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.button.copyWith(
            color: isActive ? kPrimaryColor : kTextColor.withOpacity(0.4)),
      ),
    );
  }
}
