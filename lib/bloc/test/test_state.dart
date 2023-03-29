part of 'test_bloc.dart';

@immutable
abstract class TestState {}

class TestInitial extends TestState {}

class TestLoadedState extends TestState {
  final List<String> listOfText;

  TestLoadedState({required this.listOfText});
}

class TestErrorState extends TestState {}
