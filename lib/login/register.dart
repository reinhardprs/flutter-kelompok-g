import 'package:flutter/material.dart';
import 'package:money_manage/login/login.dart';
import '../constants.dart';
import '../data/data.dart';
import '../home.dart';
import '../models/user_model.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  void _register() {
    String username = _usernameController.text;
    String emailPhone = _emailPhoneController.text;
    String password = _passwordController.text;
    String repeatPassword = _repeatPasswordController.text;

    // Check if email or phone already registered
    bool isExistingUser = userRegistrations.any((user) => user.email == emailPhone || user.phone == emailPhone);

    if (!isExistingUser) {
      // Check if passwords match
      if (password == repeatPassword) {
        // Add new user to userRegistrations
        userRegistrations.add(UserModel(
          username: username,
          email: emailPhone.contains('@') ? emailPhone : '',
          password: password,
          phone: emailPhone.contains('@') ? '' : emailPhone,
        ));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Passwords do not match'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Account already exists'),
        ),
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
          padding: EdgeInsets.only(left: 20, right: 20, bottom: size.height * 0.2, top: size.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hello, \nWelcome",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username"
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      controller: _emailPhoneController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email or Phone number"
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password"
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: TextField(
                      controller: _repeatPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Repeat Password"
                      ),
                    ),
                  ),

                ],
              ),
              Center(
                child: MaterialButton(
                  onPressed: () => {},
                  elevation: 0,
                  padding: EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  color: kTextColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Register with Google",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
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
              Center(
                child: Text("OR"),
              ),
              Column(
                children: [
                  MaterialButton(
                    onPressed: _register,
                    elevation: 0,
                    padding: EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    color: kSecondaryColor,
                    child: Center(child:Text("Register",
                      style:TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kTextColor),
                    )
                    ),
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                            (route) => false,
                      );
                    },
                    child: Text(
                      "Already have an account? Sign In here",
                      // style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
