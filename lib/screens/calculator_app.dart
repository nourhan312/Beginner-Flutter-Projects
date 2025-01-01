import 'package:calculator/screens/history.dart';
import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String inputEquation = '';
  String outputResult = '';
  List<String> history = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryScreen(history: history),
                  ),
                );
              },
              icon: const Icon(
                Icons.history,
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              child: Text(
                inputEquation,
                maxLines: 3,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.175,
              width: double.infinity,
              child: Text(
                outputResult,
                maxLines: 2,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(5),
              onPressed: () {
                setState(() {
                  if (inputEquation.isNotEmpty) {
                    inputEquation =
                        inputEquation.substring(0, inputEquation.length - 1);
                  }
                });
              },
              icon: const Icon(
                Icons.backspace_outlined,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  spacing: 11,
                  children: [
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation = '';
                          outputResult = '';
                        });
                      },
                      text: 'Ac',
                      color: Colors.orange,
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation += '7';
                        });
                      },
                      text: '7',
                      color: const Color(0xff28282A),
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation += '4';
                        });
                      },
                      text: '4',
                      color: const Color(0xff28282A),
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation += '1';
                        });
                      },
                      text: '1',
                      color: const Color(0xff28282A),
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          if (inputEquation.isNotEmpty) {
                            final operators = ['+', '-', '*', '/', '%'];
                            int lastOperatorIndex = -1;

                            for (var operator in operators) {
                              int index = inputEquation.lastIndexOf(operator);
                              if (index > lastOperatorIndex) {
                                lastOperatorIndex = index;
                              }
                            }

                            String lastNumber =
                                inputEquation.substring(lastOperatorIndex + 1);

                            if (lastNumber.isNotEmpty) {
                              if (lastNumber.startsWith('(-')) {
                                lastNumber = lastNumber.substring(
                                    2, lastNumber.length - 1);
                              } else if (lastNumber.startsWith('-')) {
                                lastNumber = '(${lastNumber.substring(1)})';
                              } else {
                                lastNumber = '(-$lastNumber)';
                              }

                              inputEquation = inputEquation.substring(
                                      0, lastOperatorIndex + 1) +
                                  lastNumber;
                            }
                          }
                        });
                      },
                      text: '+/-',
                    ),
                  ],
                ),
                Column(
                  spacing: 11,
                  children: [
                    Button(
                      onPress: () {
                        if (inputEquation.isEmpty ||
                            (inputEquation[inputEquation.length - 1] == '*' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '/' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '+' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '%' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '-')) {
                        } else {
                          setState(() {
                            inputEquation += '%';
                          });
                        }
                      },
                      text: '%',
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation += '8';
                        });
                      },
                      text: '8',
                      color: const Color(0xff28282A),
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation += '5';
                        });
                      },
                      text: '5',
                      color: const Color(0xff28282A),
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation += '2';
                        });
                      },
                      text: '2',
                      color: const Color(0xff28282A),
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation += '0';
                        });
                      },
                      text: '0',
                    ),
                  ],
                ),
                Column(
                  spacing: 11,
                  children: [
                    Button(
                      onPress: () {
                        if (inputEquation.isEmpty ||
                            (inputEquation[inputEquation.length - 1] == '*' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '/' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '+' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '%' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '-')) {
                        } else {
                          setState(() {
                            inputEquation += '/';
                          });
                        }
                      },
                      text: '/',
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation += '9';
                        });
                      },
                      text: '9',
                      color: const Color(0xff28282A),
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation += '6';
                        });
                      },
                      text: '6',
                      color: const Color(0xff28282A),
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation += '3';
                        });
                      },
                      text: '3',
                      color: const Color(0xff28282A),
                    ),
                    Button(
                      onPress: () {
                        setState(() {
                          inputEquation += '.';
                        });
                      },
                      text: '.',
                      color: const Color(0xff28282A),
                    ),
                  ],
                ),
                Column(
                  spacing: 11,
                  children: [
                    Button(
                      onPress: () {
                        if (inputEquation.isEmpty ||
                            (inputEquation[inputEquation.length - 1] == '*' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '/' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '+' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '%' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '-')) {
                        } else {
                          setState(() {
                            inputEquation += '*';
                          });
                        }
                      },
                      text: 'X',
                    ),
                    Button(
                      onPress: () {
                        if (inputEquation.isEmpty ||
                            (inputEquation[inputEquation.length - 1] == '*' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '/' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '+' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '%' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '-')) {
                        } else {
                          setState(() {
                            inputEquation += '-';
                          });
                        }
                      },
                      text: '-',
                    ),
                    Button(
                      onPress: () {
                        if (inputEquation.isEmpty ||
                            (inputEquation[inputEquation.length - 1] == '*' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '/' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '+' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '%' ||
                                inputEquation[inputEquation.length - 1] ==
                                    '-')) {
                        } else {
                          setState(() {
                            inputEquation += '+';
                          });
                        }
                      },
                      text: '+',
                    ),
                    Button(
                      onPress: () {
                        try {
                          Parser p = Parser();
                          Expression exp = p.parse(inputEquation);
                          String result = exp
                              .evaluate(EvaluationType.REAL, ContextModel())
                              .toString();
                          setState(() {
                            outputResult = result;
                            history.add('$inputEquation = $outputResult');
                          });
                        } catch (e) {
                          setState(() {
                            outputResult = 'Error';
                          });
                        }
                      },
                      text: '=',
                      color: Colors.orange,
                      height: 182,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
