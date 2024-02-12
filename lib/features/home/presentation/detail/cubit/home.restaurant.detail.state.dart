part of 'home.restaurant.detail.cubit.dart';

abstract class HomeRestaurantDetailState {}

class RestaurantDetailInitial extends HomeRestaurantDetailState {}

class Rebuild extends HomeRestaurantDetailState {}

class ErrorToasty extends HomeRestaurantDetailState {
  ErrorToasty(this.message);

  final String? message;
}
