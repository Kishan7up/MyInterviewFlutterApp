import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:kishanrathoddemoapp/models/route.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

part 'route_tracking_event.dart';
part 'route_tracking_state.dart';

class RouteTrackingBloc extends Bloc<RouteTrackingEvent, RouteTrackingState> {


  late Isar isar;
  late Stream<List<Coordinate>> locationStream;
  List<Coordinate> currentCoordinates = [];
  late Route currentRoute;


  RouteTrackingBloc() : super(RouteTrackingInitial()) {
    on<StartRouteTracking>(_onStartRouteTracking);
    on<UpdateCoordinates>(_onUpdateCoordinates);
    on<StopRouteTracking>(_onStopRouteTracking);
    on<LoadRoutes>(_onLoadRoutes);

    _initializeIsar();
  }

  Future<void> _initializeIsar() async {
    final dir = await getApplicationDocumentsDirectory();

   // isar = await Isar.open([RouteSchema], directory: dir.path);
  }

  Future<void> _onStartRouteTracking(
      StartRouteTracking event,
      Emitter<RouteTrackingState> emit,
      ) async {
    currentCoordinates = [];
    currentRoute = Route(timestamp: DateTime.now(), coordinates: []);
   // locationStream = event.locationStream;
    emit(RouteTrackingStarted());
  }

  Future<void> _onUpdateCoordinates(
      UpdateCoordinates event,
      Emitter<RouteTrackingState> emit,
      ) async {
    currentCoordinates.addAll(event.coordinates);
    currentRoute.coordinates.addAll(event.coordinates);
    emit(RouteTrackingUpdated(currentCoordinates: currentCoordinates));
  }

  Future<void> _onStopRouteTracking(
      StopRouteTracking event,
      Emitter<RouteTrackingState> emit,
      ) async {
    await isar.writeTxn(() async {
     // await isar.routes.put(currentRoute);
    });
    emit(RouteTrackingStopped());
  }

  Future<void> _onLoadRoutes(
      LoadRoutes event,
      Emitter<RouteTrackingState> emit,
      ) async {
  //  final routes = await isar.routes.filter().sortByTimestamp().findAll();
   // emit(RoutesLoaded(routes: routes));
  }
}
