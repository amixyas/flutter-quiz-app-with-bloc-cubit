part of 'quizpagecubit.dart';

@immutable
abstract class QuizPageState {}

class QuizPageInitial extends QuizPageState {
  int index = 0;
  List<Quiz> quizzes = [];

  QuizPageInitial(this.index, this.quizzes);
}
