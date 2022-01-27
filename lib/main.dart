import 'package:flashcards/flascard.dart';
import 'package:flashcards/flashcard_view.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Flashcard> _flashcard = [
    Flashcard(
        question: "What programing language does flutter use?", answer: "Dart"),
    Flashcard(question: "Who you gonna call?", answer: "Ghost"),
    Flashcard(question: "Are you fun?", answer: "Yes"),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: FlipCard(
                    front: FlashcardView(
                      text: _flashcard[currentIndex].question,
                    ),
                    back: FlashcardView(
                      text: _flashcard[currentIndex].answer,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton.icon(
                        onPressed: showPreviousCard,
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Prev',
                          style: TextStyle(color: Colors.black),
                        )),
                    OutlinedButton.icon(
                        onPressed: showNextCard,
                        icon: Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Next',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void showNextCard() {
    setState(() {
      currentIndex =
          currentIndex + 1 < _flashcard.length ? currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {}
}
