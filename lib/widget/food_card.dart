import 'package:flutter/material.dart';
import '../constants.dart';

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
