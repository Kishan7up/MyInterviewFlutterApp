// models/route.dart
import 'package:isar/isar.dart';



@collection
class Route {
  Id id = Isar.autoIncrement; // Unique ID for each route
  late DateTime timestamp; // Timestamp of when the route was started
  late List<Coordinate> coordinates; // List of coordinates for the route

  Route({
    required this.timestamp,
    required this.coordinates,
  });
}

@embedded
class Coordinate {
  late double latitude;
  late double longitude;



}