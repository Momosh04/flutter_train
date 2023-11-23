import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_bloc/model/question_model.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<SelectAnswer>((event, emit) {
      if (event.tap_answer) {
        emit(Correct());
      } else {
        emit(Wrong());
      }
    });
  }
}
