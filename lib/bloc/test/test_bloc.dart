import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'test_event.dart';
part 'test_state.dart';

List<String> listOfText = [];

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<FetchEvent>(_fetchEvent);
    on<InsertEvent>(_insertEvent);
    on<DeleteEvent>(_deleteEvent);
    on<DeleteAllEvent>(_deleteAllEvent);
  }

  void _fetchEvent(FetchEvent event, Emitter<TestState> emit) async {
    emit(TestInitial());
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(TestLoadedState(listOfText: listOfText));
    } catch (e) {
      emit(TestErrorState());
    }
  }

  void _insertEvent(InsertEvent event, Emitter<TestState> emit) {
    listOfText.add(event.text);
    emit(TestLoadedState(listOfText: listOfText));
  }

  void _deleteEvent(DeleteEvent event, Emitter<TestState> emit) {
    listOfText.remove(event.text);
    emit(TestLoadedState(listOfText: listOfText));
  }

  void _deleteAllEvent(DeleteAllEvent event, Emitter<TestState> emit) {
    listOfText.clear();
    emit(TestLoadedState(listOfText: listOfText));
  }
}
