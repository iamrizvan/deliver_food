import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/constants.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/icons/backward.svg",
                        height: 11,
                      ),
                      SvgPicture.asset(
                        "assets/icons/menu.svg",
                        height: 11,
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    margin: EdgeInsets.all(3),
                    height: 265,
                    width: 265,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kSecondaryColor),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/image_1_big.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Vegan Salad Bowl\n",
                            style: Theme.of(context).textTheme.title),
                        TextSpan(
                            text: "With red tomato",
                            style:
                                TextStyle(color: kTextColor.withOpacity(0.5)))
                      ])),
                      Text("\$20",
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .copyWith(color: kPrimaryColor))
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 27),
                          decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.19),
                              borderRadius: BorderRadius.circular(29)),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Add to bag",
                                style: Theme.of(context).textTheme.button,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              SvgPicture.asset(
                                "assets/icons/forward.svg",
                                height: 11,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kPrimaryColor.withOpacity(0.26)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(16),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPrimaryColor),
                                child: SvgPicture.asset("assets/icons/bag.svg"),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(1),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kWhiteColor),
                                  child: Text("5",
                                      style: Theme.of(context)
                                          .textTheme
                                          .button
                                          .copyWith(
                                              color: kPrimaryColor,
                                              fontSize: 12)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
    );  
  }
}
