import 'package:flutter/material.dart';
class GlobalVars with ChangeNotifier{
  var screenHeight;
  var screenWidth;
  //GlobalVars(this.screenHeight,this.screenWidth);

void addDeviceDetails(double height,double width)async{
  screenWidth=width;
  screenHeight=height;
  print(screenWidth);
  //notifyListeners();
}

  double getProportionateScreenHeight(double inputHeight){
    double sHeight = screenHeight;
    // 812 is the layout height that designer use
    return ((inputHeight/ 812.0) * sHeight).toDouble();
  }

// Get the proportionate height as per screen size
  double getProportionateScreenWidth(double inputWidth) {
    double sWidth = screenWidth;
    // 375 is the layout width that designer use
    return ((inputWidth / 375.0) * sWidth).toDouble();
  }
}