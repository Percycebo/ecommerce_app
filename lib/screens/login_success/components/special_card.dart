import 'package:e_commerce/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SpecialCard extends StatelessWidget {
  final String image;
  final String category;
  final int numberOfBrand;
  final Function press;
  SpecialCard({
    required this.image, required this.category, required this.numberOfBrand, required this.press});

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return Padding(
      padding: EdgeInsets.only(left: mediaQ.getProportionateScreenWidth(10)),
      child: GestureDetector(
        onTap: press(),
          child: SizedBox(
            height: mediaQ.getProportionateScreenWidth(100),
            width: mediaQ.getProportionateScreenWidth(242),
            child: ClipRRect(
              //clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(image,fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF343434).withOpacity(0.4),
                          Color(0xFF343434).withOpacity(0.15),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "$category\n",
                            style: TextStyle(
                              fontSize: mediaQ.getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: "$numberOfBrand Brands")
                        ],
                      )
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
 