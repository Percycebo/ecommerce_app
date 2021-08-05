import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/login_success/login_success_screen.dart';
import 'package:e_commerce/screens/otp/otp_screen.dart';
import 'package:e_commerce/screens/product_details/product_screen.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:e_commerce/screens/sign_in/sign_in.dart';
import 'package:e_commerce/screens/sign_up/sign_up_screen.dart';
import 'package:e_commerce/screens/splash/splash.dart';
import 'package:e_commerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context)=>GlobalVars(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme:theme(),
        home: SplashScreen(),
        routes: {
          SplashScreen.routeName:(context)=>SplashScreen(),
          SignInScreen.routeName:(context)=>SignInScreen(),
          ForgotPasswordScreen.routeName: (context)=>ForgotPasswordScreen(),
          LoginSuccessScreen.routeName:(context)=>LoginSuccessScreen(),
          SignUpScreen.routeName:(context)=>SignUpScreen(),
          ProfileScreen.routeName:(context)=>ProfileScreen(),
          OtpScreen.routeName:(context)=>OtpScreen(),
          HomeScreen.routeName:(context)=>HomeScreen(),
          ProductScreen.routeName:(context)=>ProductScreen(),

        },
      ),
    );
  }
}
