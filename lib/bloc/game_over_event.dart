// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'game_over_bloc.dart';

@immutable
sealed class GameOverEvent {}

class GameFinish extends GameOverEvent {
  int ans_time;
  int full_time;
  GameFinish({
    required this.ans_time,
    required this.full_time,
  });
}
