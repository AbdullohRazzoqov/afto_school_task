part of 'test_bloc.dart';

class TestState extends Equatable {
  TestStateStatus stateStatus;
  TestDate? question;
  bool? questionEvent;
  TestState({
    this.question,
    this.questionEvent,
    this.stateStatus = TestStateStatus.normal,
  });
  TestState copyWith({
    TestDate? question,
    bool? questionEvent,
    TestStateStatus stateStatus = TestStateStatus.normal,
  }) {
    return TestState(
        question: question ?? this.question,
        questionEvent: questionEvent,
        stateStatus: stateStatus);
  }

  @override
  List<Object?> get props => [question, questionEvent, ];
}
final class TestInitial extends TestState {}

enum TestStateStatus { normal, success, error, testEnd }
// birinchi normal
// biror javob bosilsa loaded
// savollar tugasa testEnd
