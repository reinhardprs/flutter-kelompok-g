import 'package:flutter/material.dart';
import 'package:money_manage/login/reset_success.dart';
import '../constants.dart';
import '../data/data.dart';
import '../models/user_model.dart';

class forgotPassword extends StatelessWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailPhoneController = TextEditingController();
    final TextEditingController _verificationCodeController = TextEditingController();
    final TextEditingController _newPasswordController = TextEditingController();
    final TextEditingController _repeatPasswordController = TextEditingController();

    void _resetPassword() {
      String emailPhone = _emailPhoneController.text;
      String newPassword = _newPasswordController.text;
      String repeatPassword = _repeatPasswordController.text;

      bool isExistingUser = userRegistrations.any((user) => user.email == emailPhone || user.phone == emailPhone);

      if (!isExistingUser) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Account not found'),
          ),
        );
      } else {
        UserModel user = userRegistrations.firstWhere((user) => user.email == emailPhone || user.phone == emailPhone);

        if (newPassword == repeatPassword) {
          user.password = newPassword;
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => resetSuccess()),
                (route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Password reset successfully'),
            ),
          );
          // Navigasi ke halaman resetSuccess setelah berhasil mereset password
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Passwords do not match'),
            ),
          );
        }
      }
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: size.height * 0.2, top: size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset your Password",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 60,),
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
                        hintText: "Email or Phone Number",
                        suffixIcon: InkWell(
                          onTap: () {
                            // Implement your action here
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              "Send Code",
                              style: TextStyle(
                                color: Colors.blue, // Change the color as needed
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        hintText: "Verification Code",
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Text(
                    "Enter your new password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // color: kTextColor
                    ),
                  ),
                  SizedBox(height: 10,),
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
                        hintText: "Password",
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        hintText: "Repeat Password",
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 60,),
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
                        "Reset",
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
    );
  }
}
