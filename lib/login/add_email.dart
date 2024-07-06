import 'package:flutter/material.dart';
import 'package:money_manage/data/data.dart';
import 'package:money_manage/home.dart';
import 'package:money_manage/models/user_model.dart';
import 'package:money_manage/settings/myaccount.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddEmailPage extends StatefulWidget {
  const AddEmailPage({super.key});

  @override
  State<AddEmailPage> createState() => _AddEmailPageState();
}

class _AddEmailPageState extends State<AddEmailPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _addEmail() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      bool isExistingEmail = userRegistrations.any((user) => user.email == email);

      if (isExistingEmail) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.emailAlreadyExistsMessage),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        _showConfirmationDialog(email, password);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.invalidEmailPasswordMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showConfirmationDialog(String email, String password) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.signInDialogTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.person, color: Colors.orange),
                title: Text(email),
              ),
              SizedBox(height: 20),
              Text(AppLocalizations.of(context)!.signInDialogContent),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text(AppLocalizations.of(context)!.cancelButtonText),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      userRegistrations.add(
                        UserModel(username: email.split('@')[0], email: email, password: password, phone: ''),
                      );

                      UserModel newUser = userRegistrations.firstWhere(
                        (user) => user.email == email,
                        orElse: () => UserModel(username: '', email: '', password: '', phone: ''),
                      );

                      Provider.of<UserProvider>(context, listen: false).setCurrentUser(newUser);

                      Navigator.pop(context); // Close the dialog

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(showPhoneNotSetDialog: true)),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.continueButtonText),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addEmail),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.email,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.password,
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addEmail,
              child: Text(AppLocalizations.of(context)!.addEmail),
            ),
          ],
        ),
      ),
    );
  }
}
