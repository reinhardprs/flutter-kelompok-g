import 'package:flutter/material.dart';
import 'package:money_manage/NavBarBottom.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/data/data.dart';
import 'package:money_manage/login/forgot_pass.dart';
import 'package:money_manage/login/register.dart';
import 'package:money_manage/models/user_model.dart';
import 'package:provider/provider.dart';

import '../home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String input = _emailPhoneController.text;
    String password = _passwordController.text;

    // Check if the user exists
    UserModel? user = userRegistrations.firstWhere(
          (user) => user.email == input || user.phone == input,
      orElse: () => UserModel(username: '', email: '', password: '', phone: ''),
    );

    if (user.username == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Account not registered'),
          backgroundColor: Colors.red,
        ),
      );
    } else if (user.password != password) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username or password invalid'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Save the logged-in user in the provider
      Provider.of<UserProvider>(context, listen: false).setCurrentUser(user);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: size.height * 0.2,
            top: size.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello, \nWelcome Back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                        hintText: "Email or Phone number",
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
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => forgotPassword()),
                            (route) => false,
                      );
                    },
                    child: Text(
                      "Forgot Password",
                      // style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              Center(
                child: MaterialButton(
                  onPressed: () => {},
                  elevation: 0,
                  padding: EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: kTextColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login with Google",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20), // Jarak antara teks dan gambar
                      Image.network(
                        'https://cdn-icons-png.flaticon.com/512/300/300221.png',
                        width: 24, // Sesuaikan lebar gambar sesuai kebutuhan
                        height: 24, // Sesuaikan tinggi gambar sesuai kebutuhan
                      ),
                    ],
                  ),
                ),
              ),
              Center(child: Text("OR")),
              Column(
                children: [
                  MaterialButton(
                    onPressed: _login,
                    elevation: 0,
                    padding: EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: kSecondaryColor,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                            (route) => false,
                      );
                    },
                    child: Text(
                      "Create account",
                      // style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
