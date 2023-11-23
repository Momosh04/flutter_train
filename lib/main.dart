import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_bloc/bloc/game_over_bloc.dart';
import 'package:quiz_bloc/bloc/quiz_bloc.dart';
import 'package:quiz_bloc/config/bloc_observe.dart';
import 'package:quiz_bloc/finish_page.dart';
import 'package:quiz_bloc/model/question_model.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(QuizApp());
}

List<QuestionModel> questions = [
  QuestionModel(
      questionSentenc: 'How Long Are You ?',
      description: 'This is an easy Question ...',
      asnwers: [
        Answer(asnwer: '20 m', isCorrect: false),
        Answer(asnwer: '10 m', isCorrect: false),
        Answer(asnwer: '5 m', isCorrect: false),
        Answer(asnwer: '1.8 m', isCorrect: true)
      ]),
  QuestionModel(
      questionSentenc: 'How Long Are You ?',
      description: 'This is an easy Question ...',
      asnwers: [
        Answer(asnwer: '20 m', isCorrect: false),
        Answer(asnwer: '10 m', isCorrect: false),
        Answer(asnwer: '5 m', isCorrect: false),
        Answer(asnwer: '1.8 m', isCorrect: true)
      ]),
  QuestionModel(
      questionSentenc: 'How Long Are You ?',
      description: 'This is an easy Question ...',
      asnwers: [
        Answer(asnwer: '20 m', isCorrect: false),
        Answer(asnwer: '10 m', isCorrect: false),
        Answer(asnwer: '5 m', isCorrect: false),
        Answer(asnwer: '1.8 m', isCorrect: true)
      ]),
  QuestionModel(
      questionSentenc: 'How Long Are You ?',
      description: 'This is an easy Question ...',
      asnwers: [
        Answer(asnwer: '20 m', isCorrect: false),
        Answer(asnwer: '10 m', isCorrect: false),
        Answer(asnwer: '5 m', isCorrect: false),
        Answer(asnwer: '1.8 m', isCorrect: true)
      ])
];

@override
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => QuizBloc(),
          ),
          BlocProvider(
            create: (context) => GameOverBloc(),
          ),
        ],
        child: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Timer timer = Timer(Duration(seconds: 1), () {});

  int start = 0;
  int score = 0;

  PageController controller = PageController();

  void initState() {
    super.initState();

    void startTimer() {
      const oneSec = const Duration(seconds: 1);
      timer = new Timer.periodic(
        oneSec,
        (Timer timer) {
          // if (start == 0) {
          //   setState(() {
          //     timer.cancel();
          //   });
          // } else
          context
              .read<GameOverBloc>()
              .add(GameFinish(ans_time: start, full_time: 20));
          setState(() {
            start++;
          });
          // }
        },
      );
    }

    context
        .read<GameOverBloc>()
        .add(GameFinish(ans_time: start, full_time: 20));

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(actions: [
        Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 80),
          child: Text(
            "$start",
            style: TextStyle(fontSize: 42),
          ),
        ))
      ]),
      body: PageView.builder(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (context, index) => Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(questions[index].questionSentenc),
                  subtitle: Text(questions[index].description),
                ),
                BlocListener(
                  listener: (context, state) {
                    if (state is TimeOut) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FinishPage(score: score),
                        ),
                      );
                    }
                  },
                ),
                BlocListener<QuizBloc, QuizState>(
                  listener: (context, state) {
                    if (state is Correct) {
                      score++;

                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        content: Text('Correct'),
                        backgroundColor: Colors.green,
                      ));

                      //questions.add(questions[index]);
                    } else if (state is Wrong) {
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        content: Text('Wrong'),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: GridView.builder(
                        itemCount: questions[index].asnwers.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2),
                        itemBuilder: (context, ind) => InkWell(
                          onTap: () {
                            context.read<QuizBloc>().add(SelectAnswer(
                                tap_answer:
                                    questions[index].asnwers[ind].isCorrect));
                            controller.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                          },
                          child: Container(
                              width: 50,
                              height: 50,
                              color: Colors.grey[200],
                              child: Center(
                                  child: Text(
                                      questions[index].asnwers[ind].asnwer))),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
