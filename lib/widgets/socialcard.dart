import 'package:e_commerce/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class SocalCard extends StatelessWidget {
  const SocalCard({
    required this.icon,
    required this.press,
  });

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return GestureDetector(
      onTap: press(),
      child: Container(
        margin:
        EdgeInsets.symmetric(horizontal: mediaQ.getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(mediaQ.getProportionateScreenWidth(12)),
        height: mediaQ.getProportionateScreenHeight(40),
        width: mediaQ.getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
