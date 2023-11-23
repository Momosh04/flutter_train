import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'game_over_event.dart';
part 'game_over_state.dart';

class GameOverBloc extends Bloc<GameOverEvent, GameOverState> {
  GameOverBloc() : super(GameOverInitial()) {
    on<GameFinish>((event, emit) {
      if (event.ans_time >= event.full_time) emit(TimeOut());
    });
  }
}
