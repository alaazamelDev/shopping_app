import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);
  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: getProportionateScreenHeight(40),
        height: getProportionateScreenHeight(40),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenHeight(12)),
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
