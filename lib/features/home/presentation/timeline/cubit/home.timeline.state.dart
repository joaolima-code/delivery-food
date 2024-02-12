part of 'home.timeline.cubit.dart';

abstract class HomeTimelineState {}

class HomeInitial extends HomeTimelineState {}

class Rebuild extends HomeTimelineState {}

class Loading extends HomeTimelineState {}

class ErrorToasty extends HomeTimelineState {
  ErrorToasty(this.message);

  final String? message;
}
