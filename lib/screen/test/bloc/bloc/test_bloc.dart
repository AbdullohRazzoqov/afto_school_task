// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/fake_data.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  List<Answer> answers = [];
  TestBloc() : super(TestInitial()) {
    on<TestEvent>((event, emit) {
      emit(state.copyWith(
        question: questions[answers.length],
      ));
    });
    on<NextQuistionEvent>((event, emit) {
      if (answers.length == questions.length) {
        emit(state.copyWith(
          stateStatus: TestStateStatus.testEnd,
        ));
      } else {
        emit(state.copyWith(question: questions[answers.length]));
      }
    });
    on<SelectAnswersEvent>((event, emit) {
      if (event.index == questions[answers.length].trueAnswers) {
        answers.add(Answer(answerEvent: true));
        emit(state.copyWith(
          questionEvent: true,
        ));
      } else {
        emit(state.copyWith(
          questionEvent: false,
        ));
        answers.add(Answer(
          answerEvent: false,
        ));
      }
    });
    add(const TestEvent());
  }
}

class Answer {
  final bool answerEvent;
  Answer({
    required this.answerEvent,
  });
}
