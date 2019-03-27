import 'package:flutter/material.dart';
import 'package:flutter_prime_energy/pages/firstpage.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = Quiz();

class Quiz {
  var images = ["question", "question", "question", "question"];

  var questions = [
    "Questão 1",
    "Questão 2",
    "Questão 3",
    "Questão 4",
  ];

  var choices = [
    ["Resposta 1", "Resposta 2", "Resposta 3", "Resposta 4"],
    ["Resposta 1", "Resposta 2", "Resposta 3", "Resposta 4"],
    ["Resposta 1", "Resposta 2", "Resposta 3", "Resposta 4"],
    ["Resposta 1", "Resposta 2", "Resposta 3", "Resposta 4"]
  ];

  var correctAnswers = ["Resposta 1", "Resposta 2", "Resposta 3", "Resposta 4"];
}

class Quiz1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(elevation: 0.2, title: Text('Quiz'),
              leading: IconButton(
              icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              debugPrint("Voltar Pressionado");
              resetQuiz();
            })),
          body: Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Questão ${questionNumber + 1} de ${quiz.questions.length}",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text(
                        "Pontos: $finalScore",
                        style: TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                ),

                //image
                Padding(padding: EdgeInsets.all(5.0)),

                Image.asset(
                  "images/${quiz.images[questionNumber]}.jpg",
                ),

                Padding(padding: EdgeInsets.all(5.0)),

                Text(
                  quiz.questions[questionNumber],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),

                Padding(padding: EdgeInsets.all(10.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 1
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][0] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correto");
                          finalScore++;
                        } else {
                          debugPrint("Errado");
                        }
                        updateQuestion();
                      },
                      child: Text(
                        quiz.choices[questionNumber][0],
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),

                    //button 2
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][1] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correto");
                          finalScore++;
                        } else {
                          debugPrint("Errado");
                        }
                        updateQuestion();
                      },
                      child: Text(
                        quiz.choices[questionNumber][1],
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.all(10.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 3
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][2] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correto");
                          finalScore++;
                        } else {
                          debugPrint("Errado");
                        }
                        updateQuestion();
                      },
                      child: Text(
                        quiz.choices[questionNumber][2],
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),

                    //button 4
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][3] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correto");
                          finalScore++;
                        } else {
                          debugPrint("Errado");
                        }
                        updateQuestion();
                      },
                      child: Text(
                        quiz.choices[questionNumber][3],
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.all(10.0)),

                Container(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                        minWidth: 180.0,
                        height: 30.0,
                        color: Colors.red,
                        onPressed: resetQuiz,
                        child: Text(
                          "Sair",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ))),
              ],
            ),
          ),
        ));
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Summary(
                      score: finalScore,
                    )));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;

  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(elevation: 0.2, title: Text('Resultado do Quiz'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                debugPrint("Voltar Pressionado");
                questionNumber = 0;
                finalScore = 0;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstPage()));
              }),),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Resultado Final: $score pontos",
                style: TextStyle(fontSize: 20.0),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 100,
                    color: Colors.green,
                    onPressed: () {
                      questionNumber = 0;
                      finalScore = 0;
                      debugPrint("Início Pressionado");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: Text(
                      "Início",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  MaterialButton(
                    minWidth: 100,
                    color: Colors.red,
                    onPressed: () {
                      questionNumber = 0;
                      finalScore = 0;
                      debugPrint("Recomeçar Pressionado");
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Recomeçar",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
