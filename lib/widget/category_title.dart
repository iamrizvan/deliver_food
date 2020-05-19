import 'package:flutter/material.dart';
import '../constants.dart';

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
