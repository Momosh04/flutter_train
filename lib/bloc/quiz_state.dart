part of 'quiz_bloc.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}

class Wrong extends QuizState {}

class Correct extends QuizState {}
