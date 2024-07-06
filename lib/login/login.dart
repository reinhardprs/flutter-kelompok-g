import 'package:flutter/material.dart';
import 'package:money_manage/NavBarBottom.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/data/data.dart';
import 'package:money_manage/login/forgot_pass.dart';
import 'package:money_manage/login/register.dart';
import 'package:money_manage/models/user_model.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home.dart';
import 'add_email.dart';

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
          content: Text(AppLocalizations.of(context)!.accountNotRegistered),
          backgroundColor: Colors.red,
        ),
      );
    } else if (user.password != password) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.invalidUnamePsw),
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

  void _showEmailSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.selectEmail),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: userRegistrations.length + 1,
              itemBuilder: (context, index) {
                if (index < userRegistrations.length) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(userRegistrations[index].email),
                    onTap: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .setCurrentUser(userRegistrations[index]);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  );
                } else {
                  return ListTile(
                    leading: Icon(Icons.add),
                    title: Text(AppLocalizations.of(context)!.addAnotherAccount),
                    onTap: () async {
                      Navigator.pop(context);
                      final newEmail = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddEmailPage()),
                      );
                      if (newEmail != null) {
                        setState(() {});
                      }
                    },
                  );
                }
              },
            ),
          ),
        );
      },
    );
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
                AppLocalizations.of(context)!.helloGreeting,
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
                        hintText: AppLocalizations.of(context)!.emailorPhone,
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
                        hintText: AppLocalizations.of(context)!.password,
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
                      AppLocalizations.of(context)!.forgotPassword,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              Center(
                child: MaterialButton(
                  onPressed: _login,
                  elevation: 0,
                  padding: EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: kSecondaryColor,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                    ),
                  ),
                ),
              ),
              Center(child: Text(AppLocalizations.of(context)!.or)),
              Center(
                child: MaterialButton(
                  onPressed: _showEmailSelectionDialog,
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
                        AppLocalizations.of(context)!.loginwithGoogle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 20),
                      Image.network(
                        'https://cdn-icons-png.flaticon.com/512/300/300221.png',
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
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
                        AppLocalizations.of(context)!.createAccount,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
