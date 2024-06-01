import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manage/constants.dart';
import 'package:provider/provider.dart';
import 'package:money_manage/models/user_model.dart';
import 'package:money_manage/data/data.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
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
                      context, 'Nama', user?.username ?? 'Unknown', 'username'),
                  _buildEditableListItem(
                      context, 'Email', user?.email ?? 'Unknown', 'email'),
                  _buildEditableListItem(context, 'No. Handphone',
                      user?.phone ?? 'Unknown', 'phone'),
                  // Tambahkan field lain sesuai dengan kebutuhan Anda
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableListItem(
      BuildContext context, String title, String content, String field) {
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
                content,
                style: GoogleFonts.aBeeZee(
                  fontSize: 15.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit ${widget.title}'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Enter new ${widget.title.toLowerCase()}',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
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
          child: Text('Save'),
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
            title: Text('View Profile Picture'),
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
            title: Text('Change Profile Picture'),
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
              color: darkMode ? Color.fromRGBO(137, 137, 137, 60) : Colors.white,
              width: 300,
              height: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close, color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
