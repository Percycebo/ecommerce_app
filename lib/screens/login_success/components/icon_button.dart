import 'package:e_commerce/constants.dart';
import 'package:e_commerce/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class IconBtn extends StatelessWidget {
  final String svgSrc;
  final Function press;
  IconBtn({
    required this.press,
    required this.svgSrc});

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return InkWell(
      onTap: press(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: mediaQ.getProportionateScreenWidth(45),
            width: mediaQ.getProportionateScreenHeight(45),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset(svgSrc,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
