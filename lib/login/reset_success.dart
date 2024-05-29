import 'package:flutter/material.dart';
import '../constants.dart';
import 'login.dart';

class resetSuccess extends StatelessWidget {
  const resetSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: kPrimaryColor,
                size: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Password Reset Successful",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your password has been reset successfully. You can now login with your new password.",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () => {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                    (route) => false,
                  ),
                },
                elevation: 0,
                padding: EdgeInsets.all(18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: kSecondaryColor,
                child: Center(
                    child: Text(
                  "Login",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
                )),
              ),
            ],
          ),
        ));
  }
}
