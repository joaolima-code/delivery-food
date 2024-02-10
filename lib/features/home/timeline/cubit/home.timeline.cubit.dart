import 'package:bloc/bloc.dart';

part 'home.timeline.state.dart';

class HomeTimelineCubit extends Cubit<HomeTimelineState> {
  HomeTimelineCubit() : super(HomeInitial());
}
