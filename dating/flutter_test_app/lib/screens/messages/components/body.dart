import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants.dart';
import 'package:flutter_test_app/models/ChatMessage.dart';

import 'chat_input_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) => const Text("Hello")
                // Message(message: demeChatMessages[index]),
                ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
