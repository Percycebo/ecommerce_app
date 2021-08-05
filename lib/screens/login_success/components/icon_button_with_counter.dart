import 'package:e_commerce/constants.dart';
import 'package:e_commerce/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class IconBtnWithCounter extends StatelessWidget {
  final String svgSrc;
  final int numberofItems;
  final Function press;
  IconBtnWithCounter({
    required this.press,
    required this.numberofItems,
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
          if(numberofItems!=0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: mediaQ.getProportionateScreenWidth(16),
                width: mediaQ.getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numberofItems",
                    style: TextStyle(
                      fontSize: mediaQ.getProportionateScreenWidth(10),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            )

        ],
      ),
    );
  }
}
