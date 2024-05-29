import 'package:flutter/material.dart';
import 'package:money_manage/constants.dart';
import 'package:provider/provider.dart';
import 'provid.dart';

class ChatPage extends StatelessWidget {
  final String chatKey;
  ChatPage({super.key, required this.chatKey});

  TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var chats = Provider.of<ChatProvider>(context).listPercakapan[chatKey];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: kScaffoldColor,
              child: Icon(Icons.support_agent_outlined),
              radius: 25,
            ),
            SizedBox(width: 15),
            Text(chats!.nama, style: TextStyle(color: kTextColor)),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    children: chats.daftarChat.map((chat) {
                      return Row(
                        mainAxisAlignment: chat.keys.join("") == "Me"
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            padding: EdgeInsets.all(10),
                            constraints: BoxConstraints(maxWidth: 250),
                            child: Text(
                              chat.values.join(""),
                              style: TextStyle(
                                  color: kTextColor
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: chat.keys.join("") == "Me"
                                  ? kPrimaryColor
                                  : kSecondaryColor,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: chatController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    width: 270,
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      Provider.of<ChatProvider>(context, listen: false)
                          .addChat({"Me": chatController.text}, chatKey);
                      chatController.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      size: 25,
                    ),
                    style: IconButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(14)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
