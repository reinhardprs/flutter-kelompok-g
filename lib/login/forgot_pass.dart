import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:money_manage/login/reset_success.dart';
import '../constants.dart';
import '../data/data.dart';
import '../models/user_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<forgotPassword> {
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _verificationCodeController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailPhoneController.dispose();
    _verificationCodeController.dispose();
    _newPasswordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  void _sendVerificationCode() {
    String emailPhone = _emailPhoneController.text;
    bool isExistingUser = userRegistrations.any((user) => user.email == emailPhone || user.phone == emailPhone);

    if (!isExistingUser) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.accountNotFound),
        ),
      );
    } else {
      String code = (Random().nextInt(9000) + 1000).toString();
      Provider.of<VerificationCodeProvider>(context, listen: false).setVerificationCode(code);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.verificationCode),
            content: Text(AppLocalizations.of(context)!.verificationCodeis('$code')),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _resetPassword() {
    String emailPhone = _emailPhoneController.text;
    String verificationCode = _verificationCodeController.text;
    String newPassword = _newPasswordController.text;
    String repeatPassword = _repeatPasswordController.text;

    bool isExistingUser = userRegistrations.any((user) => user.email == emailPhone || user.phone == emailPhone);
    bool isValidCode = Provider.of<VerificationCodeProvider>(context, listen: false).validateCode(verificationCode);

    if (!isExistingUser) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.accountNotFound),
          backgroundColor: Colors.red,
        ),
      );
    } else if (!isValidCode) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.invalidVerificationCode),
          backgroundColor: Colors.red,
        ),
      );
    } else if (newPassword != repeatPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.passwordsDoNotMatch),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      UserModel user = userRegistrations.firstWhere((user) => user.email == emailPhone || user.phone == emailPhone);
      user.password = newPassword;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => resetSuccess()),
        (route) => false,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.resetSuccessful),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => VerificationCodeProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: size.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.resetyourPassword,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TextField(
                        controller: _emailPhoneController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: AppLocalizations.of(context)!.emailorPhone,
                          suffixIcon: InkWell(
                            onTap: _sendVerificationCode,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                AppLocalizations.of(context)!.sendCode,
                                style: TextStyle(
                                  color: Colors.blue, // Change the color as needed
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TextField(
                        controller: _verificationCodeController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: AppLocalizations.of(context)!.verificationCode,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      AppLocalizations.of(context)!.enterNewPassword,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TextField(
                        controller: _newPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: AppLocalizations.of(context)!.password,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TextField(
                        controller: _repeatPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: AppLocalizations.of(context)!.repeatPassword,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: _resetPassword,
                      elevation: 0,
                      padding: EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: kSecondaryColor,
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.reset,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
