import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242424),
      appBar: AppBar(
        backgroundColor: Color(0xff242424),
        title: Text('About Me ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25)),
        centerTitle: true,
      ),
      body: Column(
        spacing: 5,
        children: [
          SizedBox(
            height: 45,
          ),
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage(
              'assets/images/cat.jpeg',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SelectableText(
            'Nourhan Ayman ',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SelectableText(
            'Flutter  Developer',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              leading: Icon(Icons.phone),
              title: Text('+123 456 7890'),
            ),
          ),
          Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('Nouraymanghoniem@gmail.com '),
              )),
        ],
      ),
    );
  }
}
