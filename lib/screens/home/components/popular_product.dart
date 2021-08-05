import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/providers.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: mediaQ.getProportionateScreenWidth(0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular products',style: TextStyle(
                fontSize: mediaQ.getProportionateScreenWidth(20),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
              GestureDetector(
                child: Text('See more'),
                onTap: (){},
              )
            ],
          ),
        ),
        SizedBox(height: mediaQ.getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                    (index) {
                  if (demoProducts[index].isPopular)
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: mediaQ.getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
