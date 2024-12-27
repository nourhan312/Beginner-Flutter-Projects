import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/chat.dart';

class NewchatDialog extends StatefulWidget {
  final List<Chat> chats;
  final Function(Chat) onChatAdded; // Callback to notify HomeScreen

  NewchatDialog({required this.chats, required this.onChatAdded});

  @override
  State<NewchatDialog> createState() => _NewchatDialogState();
}

class _NewchatDialogState extends State<NewchatDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF242424),
      title: const Text(
        'New Chat',
        style: TextStyle(color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Enter Name',
              labelStyle: TextStyle(color: Colors.blue[800]),
              filled: true,
              fillColor: const Color(0xFF383838),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue[800]!, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: messageController,
            style: const TextStyle(color: Colors.white),
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Enter Message',
              labelStyle: TextStyle(color: Colors.blue[800]),
              filled: true,
              fillColor: const Color(0xFF383838),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue[800]!, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            nameController.clear();
            messageController.clear();
          },
          child: const Text(
            'Clear',
            style: TextStyle(color: Colors.red),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (nameController.text.isNotEmpty &&
                messageController.text.isNotEmpty) {
              final newChat = Chat(
                name: nameController.text,
                message: messageController.text,
                image: 'assets/images/person.png',
                date: 'Just Now',
              );
              widget.onChatAdded(newChat); // Notify HomeScreen
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please enter both name and message'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: const Text(
            'Add Chat',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
