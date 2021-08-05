import 'package:e_commerce/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    required this.color,
    required this.child,
  });

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return Container(
      margin: EdgeInsets.only(top: mediaQ.getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(top: mediaQ.getProportionateScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}
