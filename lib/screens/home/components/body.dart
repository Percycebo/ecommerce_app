import 'package:e_commerce/constants.dart';
import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/home/components/popular_product.dart';
import 'package:e_commerce/screens/login_success/components/icon_button.dart';
import 'package:e_commerce/screens/login_success/components/icon_button_with_counter.dart';
import 'package:e_commerce/screens/login_success/components/special_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    final mediaQ=Provider.of<GlobalVars>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: mediaQ.screenHeight*0.02,
            ),
            buildSearchPad(mediaQ),
            buildSaleBanner(mediaQ),
            buildCategory(mediaQ, categories),
            SizedBox(height: mediaQ.getProportionateScreenHeight(10),),
            buildSpecialForYou(mediaQ),

          ],
        ),
      ),
    );
  }

  Padding buildSpecialForYou(GlobalVars mediaQ) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQ.getProportionateScreenWidth(20)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Special for you',style: TextStyle(
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
                SizedBox(height: mediaQ.getProportionateScreenHeight(20),),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SpecialCard(
                          image:"assets/images/Image Banner 2.png", category: "Smartphone", numberOfBrand: 18, press: (){}),
                      SpecialCard(
                          image:"assets/images/Image Banner 3.png", category: "Fashion", numberOfBrand: 24, press: (){}),
                      SizedBox(
                        width: mediaQ.getProportionateScreenWidth(20),
                      )
                    ],
                  ),
                ),
                PopularProducts()
              ],
            ),
          );
  }

  Padding buildCategory(GlobalVars mediaQ, List<Map<String, dynamic>> categories) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQ.getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  categories.length,
                      (index) => CategoryCard(
                          press: (){},
                          icon: categories[index]['icon'],
                          text: categories[index]['text'],
                      )
              ),
            ),
          );
  }

  Container buildSaleBanner(GlobalVars mediaQ) {
    return Container(
            // height: 90,
            width: double.infinity,
            margin: EdgeInsets.all(mediaQ.getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(
              horizontal: mediaQ.getProportionateScreenWidth(20),
              vertical: mediaQ.getProportionateScreenWidth(15),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF4A3298),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(text: "Winter special \n"),
                  TextSpan(
                    text: "Cashback 40%",
                    style: TextStyle(
                      fontSize: mediaQ.getProportionateScreenWidth(24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Padding buildSearchPad(GlobalVars mediaQ) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQ.getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildContainer(mediaQ),
                IconBtn(press: (){}, svgSrc: "assets/icons/Cart Icon.svg"),
                IconBtnWithCounter(
                    press: (){},
                    numberofItems: 3,
                    svgSrc: "assets/icons/Bell.svg")
              ],
            ),
          );
  }

  Container buildContainer(GlobalVars mediaQ) {
    return Container(
            width: mediaQ.screenWidth*0.6,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)
            ),
            child: TextField(
              onChanged: (value)=>print(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: mediaQ.getProportionateScreenWidth(20),
                  vertical: mediaQ.getProportionateScreenHeight(15)
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: 'Search product',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          );
  }
}

class CategoryCard extends StatelessWidget {
  final String icon, text;
  final Function press;
  CategoryCard({
    required this.press,
    required this.icon,
    required this.text,
});

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return GestureDetector(
      onTap: press(),
      child: SizedBox(
        width: mediaQ.getProportionateScreenWidth(60),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(mediaQ.getProportionateScreenWidth(10)),
              height: mediaQ.getProportionateScreenWidth(55),
              width: mediaQ.getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
              
            ),
            SizedBox(
              height: mediaQ.getProportionateScreenHeight(5),
            ),
            Text(text,textAlign: TextAlign.center,),
          ],
        ),
      )
    );
  }
}

