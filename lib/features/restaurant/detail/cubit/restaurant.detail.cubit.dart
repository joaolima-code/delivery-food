import 'package:bloc/bloc.dart';

part 'restaurant.detail.state.dart';

class RestaurantDetailCubit extends Cubit<RestaurantDetailState> {
  RestaurantDetailCubit() : super(RestaurantDetailInitial());
}
