import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manage/constants.dart';
import 'package:provider/provider.dart';
import 'package:money_manage/models/user_model.dart';
import 'package:money_manage/data/data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool _showPassword = false;

  void _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.myAccount,
          style: GoogleFonts.abel(
            fontSize: 25.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomSheetContent(),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(color: kScaffoldColor),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 70,
                      ),
                      backgroundColor: kTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(color: kPrimaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEditableListItem(
                      context, AppLocalizations.of(context)!.name, user?.username ?? 'Unknown', 'username'),
                  _buildEditableListItem(
                      context, 'Email', user?.email ?? 'Unknown', 'email'),
                  _buildEditableListItem(
                      context, AppLocalizations.of(context)!.phoneNumber, user?.phone ?? '', 'phone'),
                  _buildPasswordItem(context, user?.password ?? '********'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordItem(BuildContext context, String password) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.password,
                style: GoogleFonts.aBeeZee(
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              color: kTextColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => EditDialog(
                    title: AppLocalizations.of(context)!.password,
                    field: AppLocalizations.of(context)!.password,
                    currentValue: password,
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _showPassword ? password : '********',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 15.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                    color: kTextColor,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  _showPassword ? Icons.visibility_off : Icons.visibility,
                ),
                color: kTextColor,
                onPressed: _toggleShowPassword,
              ),
            ],
          ),
        ),
        Divider(
          color: kTextColor,
          thickness: 1,
          height: 10,
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEditableListItem(
      BuildContext context, String title, String content, String field) {
    String displayContent = content.isEmpty ? AppLocalizations.of(context)!.setPhoneNumber : content;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.aBeeZee(
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              color: kTextColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => EditDialog(
                    title: title,
                    field: field,
                    currentValue: content,
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                displayContent,
                style: GoogleFonts.aBeeZee(
                  fontSize: 15.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  color: content.isEmpty ? Colors.grey : kTextColor,
                ),
              ),
              Divider(
                color: kTextColor,
                thickness: 1,
                height: 10,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class EditDialog extends StatefulWidget {
  final String title;
  final String field;
  final String currentValue;

  EditDialog({required this.title, required this.field, required this.currentValue});

  @override
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late TextEditingController _controller;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPasswordField = widget.field == 'password';

    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.edit('${widget.title}')),
      content: TextField(
        controller: _controller,
        obscureText: isPasswordField && !_showPassword,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.enterNew('${widget.title.toLowerCase()}'),
          suffixIcon: isPasswordField ? IconButton(
            icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
            onPressed: _toggleShowPassword,
          ) : null,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context)!.cancelButtonText),
        ),
        TextButton(
          onPressed: () {
            // Update the user information
            final newValue = _controller.text;
            if (newValue.isNotEmpty) {
              Provider.of<UserProvider>(context, listen: false).updateUserField(widget.field, newValue);
            }
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.save),
        ),
      ],
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.visibility),
            title: Text(AppLocalizations.of(context)!.viewProfilePicture),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => ProfilePicDialog(
                  context,
                  'https://via.placeholder.com/150',
                  'KelompokG',
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text(AppLocalizations.of(context)!.changeProfilePicture),
            onTap: () {
              // Implement change profile picture functionality here
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

Widget ProfilePicDialog(BuildContext context, String imageUrl, String name) {
  var darkMode = false; // Set your dark mode logic here
  return Dialog(
    child: Stack(
      children: [
        Container(
          width: 300,
          height: 300,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              width: 300,
              color: Colors.black26,
              padding: EdgeInsets.all(10),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 250,
            ),
            Container(
              color: darkMode ? Color.fromRGBO(137, 137, 137, 0.9) : Colors.white,
              width: 300,
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.download),
                    title: Text(AppLocalizations.of(context)!.download),
                    onTap: () {
                      // Implement download functionality here
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text(AppLocalizations.of(context)!.share),
                    onTap: () {
                      // Implement share functionality here
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
