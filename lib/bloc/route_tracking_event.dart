part of 'route_tracking_bloc.dart';

abstract class RouteTrackingEvent extends Equatable {
  const RouteTrackingEvent();

  @override
  List<Object> get props => [];
}

class StartRouteTracking extends RouteTrackingEvent {}

class UpdateCoordinates extends RouteTrackingEvent {
  final List<Coordinate> coordinates;

  const UpdateCoordinates(this.coordinates);

  @override
  List<Object> get props => [coordinates];
}

class StopRouteTracking extends RouteTrackingEvent {}

class LoadRoutes extends RouteTrackingEvent {}
