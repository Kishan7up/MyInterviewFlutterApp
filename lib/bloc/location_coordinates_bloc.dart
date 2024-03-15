import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'location_coordinates_event.dart';
part 'location_coordinates_state.dart';

class LocationCoordinatesBloc extends Bloc<LocationCoordinatesEvent, LocationCoordinatesState> {
  LocationCoordinatesBloc() : super(LocationCoordinatesInitial()) {
    on<LocationCoordinatesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
