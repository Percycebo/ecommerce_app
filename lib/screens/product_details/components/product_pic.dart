import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProductPic extends StatefulWidget {
  final int id;
  ProductPic({required this.id});
  @override
  _ProductPicState createState() => _ProductPicState();
}

class _ProductPicState extends State<ProductPic> {
  int selectedImage=0;

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    final product=demoProducts.firstWhere((element) => element.id==widget.id);
    return Column(
      children: [
        SizedBox(
          width: mediaQ.getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
              child: Hero(
                  tag: product.id.toString(),
                  child: Image.asset(product.images[selectedImage]))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
           ...List.generate(product.images.length, (index) =>GestureDetector(
             onTap: (){
               setState(() {
                 selectedImage=index;
               });
             },
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: AnimatedContainer(
                 height: mediaQ.getProportionateScreenHeight(44),
                 width: mediaQ.getProportionateScreenWidth(44),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(mediaQ.getProportionateScreenWidth(5)),
                   color: Colors.white,
                   border: Border.all(
                     color: kPrimaryColor.withOpacity(selectedImage==index?1:0)
                   )
                 ),
                 duration: defaultDuration ,
                 child: Image.asset(product.images[index]),
               ),
             ),
           ) )
         ],
        )
      ],
    );
  }
}
