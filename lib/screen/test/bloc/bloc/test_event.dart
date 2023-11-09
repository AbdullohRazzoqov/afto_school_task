part of 'test_bloc.dart';

class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}

class SelectAnswersEvent extends TestEvent {
  final int index;
  const SelectAnswersEvent({
    required this.index,
  });
}

class NextQuistionEvent extends TestEvent {}
