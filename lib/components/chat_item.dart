import 'package:flutter/material.dart';

import '../models/chat.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.chat});

  final Chat chat;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          CircleAvatar(backgroundImage: AssetImage(chat.image), radius: 30),
      title: SelectableText(chat.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
      subtitle: SelectableText(chat.message),
      trailing: Text(chat.date, style: TextStyle(color: Colors.white)),
    );
  }
}
