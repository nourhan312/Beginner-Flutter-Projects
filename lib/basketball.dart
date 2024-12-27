import 'package:flutter/material.dart';

class Basketball extends StatefulWidget {
  const Basketball({super.key});

  @override
  State<Basketball> createState() => _BasketballState();
}

class _BasketballState extends State<Basketball> {
  static int counterA = 0;
  static int counterB = 0;
  int addOneA() => counterA += 1;
  int addOneB() => counterB += 1;
  int addTwoA() => counterA += 2;
  int addTwoB() => counterB += 2;
  int addThreeA() => counterA += 3;
  int addThreeB() => counterB += 3;
  int resetCounterA() => counterA = 0;
  int resetCounterB() => counterB = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242424),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF242424),
        title: const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Points Counter",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    "Team A",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  Text(
                    "$counterA",
                    style: const TextStyle(fontSize: 120),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addOneA();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      disabledForegroundColor: Colors.black,
                      disabledBackgroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(120, 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    child: const Text(
                      "Add 1 Point",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addTwoA();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      disabledForegroundColor: Colors.black,
                      disabledBackgroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(120, 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    child: const Text(
                      "Add 2 Point",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addThreeA();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      disabledForegroundColor: Colors.black,
                      disabledBackgroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(120, 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    child: const Text(
                      "Add 3 Point",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
              // or Expanded
              const SizedBox(
                height: 450,
                child: VerticalDivider(
                  color: Colors.grey,
                  width: 50,
                  thickness: 1,
                  indent: 25,
                ),
              ),
              Column(
                children: [
                  const Text(
                    "Team B",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  Text(
                    "$counterB",
                    style: const TextStyle(fontSize: 120),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addOneB();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      disabledForegroundColor: Colors.black,
                      disabledBackgroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(120, 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    child: const Text(
                      "Add 1 Point",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addTwoB();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      disabledForegroundColor: Colors.black,
                      disabledBackgroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(120, 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    child: const Text(
                      "Add 2 Point",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addThreeB();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      disabledForegroundColor: Colors.black,
                      disabledBackgroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(120, 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    child: const Text(
                      "Add 3 Point",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 80),
          ElevatedButton(
            onPressed: () {
              setState(() {
                resetCounterA();
                resetCounterB();
              });
            },
            style: ElevatedButton.styleFrom(
              disabledForegroundColor: Colors.black,
              disabledBackgroundColor: Colors.blue,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              minimumSize: const Size(200, 50),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1))),
            ),
            child: const Text(
              "Reset",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
