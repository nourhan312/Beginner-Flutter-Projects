import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  final List<String> history;
  const HistoryScreen({Key? key, required this.history}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'History',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  widget.history.clear();
                });
              },
              icon: const Icon(Icons.delete))
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: widget.history.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                widget.history[index],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}
