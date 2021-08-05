import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/product_details/components/body.dart';
import 'package:e_commerce/screens/product_details/components/custom_bar.dart';
import 'package:flutter/material.dart';
class ProductScreen extends StatelessWidget {
  static String routeName='Product details';

  @override
  Widget build(BuildContext context) {
    final int id=ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Body(
        product: demoProducts.firstWhere((element) => id==element.id),
      ),
    );
  }
}

