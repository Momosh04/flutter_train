part of 'game_over_bloc.dart';

@immutable
sealed class GameOverState {}

final class GameOverInitial extends GameOverState {}

class TimeOut extends GameOverState {}

class Finish extends GameOverState {}
