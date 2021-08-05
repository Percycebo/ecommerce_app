import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/product_details/components/custom_bar.dart';
import 'package:e_commerce/screens/product_details/components/product_pic.dart';
import 'package:e_commerce/screens/product_details/components/top_rounded_container.dart';
import 'package:e_commerce/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class Body extends StatelessWidget {
  final Product product;
  Body({required this.product});

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return ListView(
      children: [
        SizedBox(
          height: mediaQ.getProportionateScreenHeight(5),
        ),
        CustomAppBar(rating: product.rating),
        Divider(),
        ProductPic(id: product.id),
        TopRoundedContainer(color: Colors.white, child: Column(
          children: [
            Text(product.title, style: Theme.of(context).textTheme.headline6,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.all(mediaQ.getProportionateScreenWidth(15)),
                width: mediaQ.getProportionateScreenWidth(64),
                decoration: BoxDecoration(
                  color:
                  product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: SvgPicture.asset(
                  "assets/icons/Heart Icon_2.svg",
                  color:
                  product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                  height: mediaQ.getProportionateScreenWidth(16),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: mediaQ.getProportionateScreenWidth(20),
                right: mediaQ.getProportionateScreenWidth(64),
              ),
              child: Text(
                product.description,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQ.getProportionateScreenWidth(20),
                vertical: 10,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "See More Detail",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            )

              ],
        )),
        TopRoundedContainer(
          color: Color(0xFFF6F7F9),
          child: Column(
            children: [
              //ColorDots(product: product),
              TopRoundedContainer(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: mediaQ.screenWidth * 0.15,
                    right: mediaQ.screenWidth * 0.15,
                    bottom: mediaQ.getProportionateScreenWidth(40),
                    top: mediaQ.getProportionateScreenWidth(15),
                  ),
                  child: DefaultButton(
                    text: "Add To Cart",
                    press: () {},
                  ),
                ),
              ),
            ],
          ),
        )

      ],
    );
  }
}
