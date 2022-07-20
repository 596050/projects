import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/filled_outline_button.dart';
import 'package:flutter_test_app/constants.dart';
import 'package:flutter_test_app/models/Chat.dart';
import 'package:flutter_test_app/screens/messages/message_screen.dart';

import 'chat_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(press: () {}, text: "Recent Message"),
              SizedBox(width: kDefaultPadding),
              FillOutlineButton(
                press: () {},
                text: "Active",
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.pushNamed(context, MessagesScreen.id),
            ),
          ),
        ),
      ],
    );
  }
}
