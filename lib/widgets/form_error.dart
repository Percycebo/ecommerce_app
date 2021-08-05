import 'package:e_commerce/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class FormError extends StatelessWidget {
  const FormError({
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return Column(
      children: List.generate(
          errors.length, (index) => Row(
        children: [
      SvgPicture.asset(
      "assets/icons/Error.svg",
        height: mediaQ.getProportionateScreenWidth(14),
        width: mediaQ.getProportionateScreenWidth(14),
      ),
        SizedBox(
          width: mediaQ.getProportionateScreenWidth(10),
        ),
        Text(errors[index]),
        ],
      )),
    );
  }

}
