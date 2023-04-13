import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flash_card_app/flashCardPackage/cards.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _flashCardApp createState() => _flashCardApp();
}

class _flashCardApp extends State<MyApp> {
  int _currentIndex = 0;

  final List<Cards> cards = [
    Cards(questions: "What is Noun?", answers: "Naming word is called Noun"),
    Cards(questions: "What is verb?", answers: "Naming word is called verb"),
    Cards(
        questions: "What is adjective?",
        answers: "Naming word is called adjective"),
    Cards(questions: "What is Tens?", answers: "Naming word is called Tens"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flsh Card App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flash Card App"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Text(
                "Flash Card App",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            Column(
              children: [
                FlipCard(
                    front: Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Text(
                          cards[_currentIndex].questions,
                          style: TextStyle(
                            backgroundColor: Colors.blue,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    back: Container(
                      height: 50,
                      width: 50,
                      child: Center(
                          child: Text(
                        cards[_currentIndex].answers,
                        style: TextStyle(
                          backgroundColor: Colors.blue,
                          color: Colors.white,
                        ),
                      )),
                    ))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = (_currentIndex - 1) % cards.length;
                    });
                  },
                  child: Text("Previous"),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = (_currentIndex + 1) % cards.length;
                    });
                  },
                  child: Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
