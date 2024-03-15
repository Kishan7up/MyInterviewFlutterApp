part of 'route_tracking_bloc.dart';

abstract class RouteTrackingState extends Equatable {
  const RouteTrackingState();

  @override
  List<Object> get props => [];
}

class RouteTrackingInitial extends RouteTrackingState {}

class RouteTrackingStarted extends RouteTrackingState {}

class RouteTrackingUpdated extends RouteTrackingState {
  final List<Coordinate> currentCoordinates;

  const RouteTrackingUpdated({required this.currentCoordinates});

  @override
  List<Object> get props => [currentCoordinates];
}

class RouteTrackingStopped extends RouteTrackingState {}

class RoutesLoaded extends RouteTrackingState {
  final List<Route> routes;

  const RoutesLoaded({required this.routes});

  @override
  List<Object> get props => [routes];
}

class RouteTrackingError extends RouteTrackingState {
  final String message;

  const RouteTrackingError(this.message);

  @override
  List<Object> get props => [message];
}
