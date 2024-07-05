import 'package:flutter/material.dart';
import 'package:money_manage/home.dart';
import 'package:money_manage/login/login.dart';
import 'package:money_manage/manage_data/add_data.dart';
import 'package:money_manage/manage_data/edit_maxAmount.dart';
import 'package:money_manage/settings/setting.dart';
import 'package:money_manage/constants.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'data/data.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.currentUser;
    final userName = user?.username ?? "Guest";
    final userPhone = user?.phone ?? "not registered";

    return Drawer(
      child: Container(
        color: kPrimaryColor,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 200, // Customize the height here
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://addons-media.operacdn.com/media/CACHE/images/themes/85/186585/1.0-rev1/images/48bf04c7-d9ab-4eb3-9e4a-672fd42dfb48/fcbdafe1ea1ec3c29970503338c8a834.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.account_circle, color: kTextColor, size: 60),
                          SizedBox(height: 10),
                          Text(
                            userName,
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            userPhone,
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.home,
                      style: TextStyle(color: kTextColor),
                    ),
                    leading: Icon(Icons.home, color: kSecondaryColor),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                  ),
                  Divider(color: Colors.grey[400]),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.addExpense,
                      style: TextStyle(color: kTextColor),
                    ),
                    leading: Icon(Icons.add, color: kSecondaryColor),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => AddData()));
                    },
                  ),
                  Divider(color: Colors.grey[400]),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.editMaxExpense,
                      style: TextStyle(color: kTextColor),
                    ),
                    leading: Icon(Icons.edit, color: kSecondaryColor),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => EditMaxAmount()));
                    },
                  ),
                  Divider(color: Colors.grey[400]),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.setting,
                      style: TextStyle(color: kTextColor),
                    ),
                    leading: Icon(Icons.settings, color: kSecondaryColor),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => SettingApp()));
                    },
                  ),
                  Divider(color: Colors.grey[400]),

                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: kSecondaryColor),
                    title: Text(
                      AppLocalizations.of(context)!.logOut,
                      style: TextStyle(color: kTextColor),
                    ),
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kTextColor,
          title: Text(AppLocalizations.of(context)!.logOut),
          content: Text(AppLocalizations.of(context)!.msgLogOut),
          actions: [
            TextButton(
              child: Text(AppLocalizations.of(context)!.yes),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false,
                );
              },
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.no),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

}
