import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp22/cubit/quizpagecubit.dart';

class QuizPage extends StatelessWidget {
  QuizPage({Key? key, String? title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _quizpagecubit = context.read<QuizPageCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
          title: const Text(
              "Quiz",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400
              )
          ), centerTitle: true
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  color: Colors.white,
                  child: Image.asset(_quizpagecubit.quizzes[_quizpagecubit.index].getImage()),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Text(
                _quizpagecubit.quizzes[_quizpagecubit.index].getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                              ),
                              onPressed: () {
                                if (_quizpagecubit.quizzes[_quizpagecubit.index].answer == "True") {
                                  ScaffoldMessenger.of(context).showSnackBar(_quizpagecubit.correctAnswer());
                                  _quizpagecubit.nextQuiz();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(_quizpagecubit.wrongAnswer());
                                }
                              },
                              child: const Text(
                                "True",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400
                                ),
                                textAlign: TextAlign.center,
                              )
                          ),
                        )),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              if (_quizpagecubit.quizzes[_quizpagecubit.index].answer == "False") {
                                ScaffoldMessenger.of(context).showSnackBar(_quizpagecubit.correctAnswer());
                                _quizpagecubit.nextQuiz();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(_quizpagecubit.wrongAnswer());
                              }
                            },
                            child: const Text(
                              "False",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400
                              ),
                              textAlign: TextAlign.center,
                            )
                        )
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _quizpagecubit.nextQuiz();
                          },
                          child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
