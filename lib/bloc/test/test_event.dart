part of 'test_bloc.dart';

@immutable
abstract class TestEvent {}

class FetchEvent extends TestEvent {}

class InsertEvent extends TestEvent {
  final String text;

  InsertEvent({required this.text});
}

class DeleteEvent extends TestEvent {
  final String text;

  DeleteEvent({required this.text});
}

class DeleteAllEvent extends TestEvent {}
