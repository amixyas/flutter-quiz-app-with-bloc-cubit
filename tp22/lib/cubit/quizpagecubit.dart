import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:tp22/models/quizmodel.dart';

import '../data/quizdataset.dart';

part 'quizpagestate.dart';

class QuizPageCubit extends Cubit<QuizPageState> {
  QuizPageCubit(this._index, this._quizzes) : super(QuizPageInitial(0, getQuizzes()));

  List<Quiz> _quizzes = [];
  int _index = 0;

  void nextQuiz() {
    index = (index + 1) % quizzes.length;
    emit(QuizPageInitial(index, quizzes));
  }

  int get index => _index;

  set index(int value) {
    _index = value;
    emit(QuizPageInitial(index, quizzes));
  }

  List<Quiz> get quizzes => _quizzes;

  set quizzes(List<Quiz> value) {
    _quizzes = value;
    emit(QuizPageInitial(index, quizzes));
  }

  SnackBar correctAnswer(){
    var snackMessage = "Correct answer :)";
    return SnackBar(
        content: Text(snackMessage), backgroundColor: Colors.green
    );
  }
  SnackBar wrongAnswer(){
    var snackMessage = "Wrong answer :(";
    return SnackBar(
        content: Text(snackMessage), backgroundColor: Colors.red
    );
  }
}