import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants.dart';
import 'package:flutter_test_app/models/ChatMessage.dart';
import 'package:flutter_test_app/screens/messages/components/message.dart';

import 'chat_input_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              // itemBuilder: (context, index) => const Text("Hello")
              itemBuilder: (context, index) =>
                  Message(message: demeChatMessages[index]),
            ),
          ),
        ),
        const ChatInputField(),
      ],
    );
  }
}
