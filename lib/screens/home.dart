import 'package:flutter/material.dart';
import 'package:massenger_ui/components/newChat.dart';
import 'package:massenger_ui/components/story_item.dart';
import 'package:massenger_ui/models/chat.dart';
import 'package:massenger_ui/models/story.dart';
import 'package:get/get.dart';
import '../components/chat_item.dart';
import '../models/story details.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Chat> chats = [
    Chat(
        image: 'assets/images/1.jpeg',
        message: 'Hello',
        date: '12:00 PM',
        name: 'farah'),
    Chat(
        image: 'assets/images/2.jpg',
        message: 'Hi',
        date: '12:00 PM',
        name: 'sara'),
    Chat(
        image: 'assets/images/3.jpeg',
        message: 'How are you',
        date: '12:00 PM',
        name: 'salma'),
    Chat(
        image: 'assets/images/4.jpeg',
        message: 'Good',
        date: '12:00 PM',
        name: 'rahma'),
    Chat(
        image: 'assets/images/5.jpeg',
        message: 'Fine',
        date: '12:00 PM',
        name: 'yassmin'),
    Chat(
        image: 'assets/images/6.jpeg',
        message: 'Thanks',
        date: '12:00 PM',
        name: 'Sara'),
    Chat(
        image: 'assets/images/7.jpeg',
        message: 'Welcome',
        date: '12:00 PM',
        name: 'Nada'),
  ];

  final List<Story> stories = [
    Story(image: 'assets/images/1.jpeg', name: 'Maha'),
    Story(image: 'assets/images/2.jpg', name: 'karma'),
    Story(image: 'assets/images/3.jpeg', name: 'Mona'),
    Story(image: 'assets/images/4.jpeg', name: 'romy'),
    Story(image: 'assets/images/5.jpeg', name: 'Nour'),
    Story(image: 'assets/images/6.jpeg', name: 'Sara'),
    Story(image: 'assets/images/7.jpeg', name: 'mariam'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242424),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF242424),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage('assets/images/1.jpeg'),
                    radius: 40,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Nourhan',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Nourhanaymanghonim@gmail.com',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: const Text(
                'Log out',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              leading: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color(0xFF242424),
        title: const Text(
          'Massenger UI',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return NewchatDialog(
                chats: chats,
                onChatAdded: (Chat newChat) {
                  setState(() {
                    chats.add(newChat);
                  });
                },
              );
            },
          );
        },
        backgroundColor: Colors.blue[800],
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 25),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.to(StoryDetails(
                    image: stories[index].image,
                  ));
                },
                child: StoryItem(
                  story: stories[index],
                ),
              ),
              itemCount: stories.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          ListView.builder(
            itemBuilder: (context, index) => Dismissible(
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete),
              ),
              onDismissed: (direction) {
                setState(() {
                  chats.removeAt(index);
                });
              },
              key: ValueKey(chats[index]),
              child: ChatItem(
                chat: chats[index],
              ),
            ),
            itemCount: chats.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
