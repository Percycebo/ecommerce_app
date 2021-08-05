import 'package:e_commerce/providers.dart';
import 'package:e_commerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/login_success/login_success_screen.dart';
import 'package:e_commerce/widgets/default_button.dart';
import 'package:e_commerce/widgets/form_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
class SignInForm extends StatefulWidget {

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey=GlobalKey<FormState>();
  String email='';
  String password='';
  bool remember=false;
  final List<String> errors=[];

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQ=Provider.of<GlobalVars>(context);
    return Form(
      key: _formKey,
        child: Column(
          children: [
            buildEmailTextFormField(),
            SizedBox(
              height: mediaQ.screenHeight*0.01,
            ),
            buildPasswordTextFormField(),
            Row(
              children: [
                Checkbox(
                    value: remember,
                    onChanged: (value){
                      setState(() {
                        remember=value!;
                      });
                    },
                ),
                Text('Remember me'),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
                  },
                  child: Text('Forgot Password',
                    style: TextStyle(decoration: TextDecoration.underline),),
                )
              ],
            ),
            SizedBox(
              height: mediaQ.screenHeight*0.04,
            ),
            FormError(errors: errors),
            SizedBox(
              height: mediaQ.screenHeight*0.04,
            ),
            DefaultButton(text: 'Continue', press: (){
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                //KeyboardUtil.hideKeyboard(context);
                //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                Navigator.of(context).pushNamed(LoginSuccessScreen.routeName);
              }
            })
          ],
        ));
  }


  TextFormField buildPasswordTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue)=>password=newValue!,
      onChanged: (value){
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value){
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",

          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              'assets/icons/Lock.svg',
              width: 6,
              height: 20,
              fit: BoxFit.contain,
            ),
          )
      ),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue)=>email=newValue!,
            onChanged: (value){
              if(value.isNotEmpty){
                if (value.isNotEmpty) {
                  removeError(error: kEmailNullError);
                } else if (emailValidatorRegExp.hasMatch(value)) {
                  removeError(error: kInvalidEmailError);
                }
                return null;
              }
            },
            validator: (value){
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value!)) {
                addError(error: kInvalidEmailError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SvgPicture.asset(
                  'assets/icons/Mail.svg',
                    width: 6,
                    height: 20,
                    fit: BoxFit.contain,
                ),
              )
            ),
          );
  }
}
