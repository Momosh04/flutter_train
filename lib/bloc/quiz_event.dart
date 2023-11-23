// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

class SelectAnswer extends QuizEvent {
  bool tap_answer;
  SelectAnswer({
    required this.tap_answer,
  });
}
