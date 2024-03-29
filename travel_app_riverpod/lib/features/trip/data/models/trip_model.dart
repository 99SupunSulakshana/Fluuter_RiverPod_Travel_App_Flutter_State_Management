import 'package:hive/hive.dart';
import 'package:travel_app_riverpod/features/trip/domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> photoes;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String location;

  TripModel(
      {required this.title,
      required this.photoes,
      required this.description,
      required this.date,
      required this.location});

  // Conversion from Entity to model
  factory TripModel.fromEntity(Trip trip) => TripModel(
      title: trip.title,
      photoes: trip.photoes,
      description: trip.description,
      date: trip.date,
      location: trip.location);

  // Coversion from Model to Entity
  Trip toEntity() => Trip(
      title: title,
      photoes: photoes,
      description: description,
      date: date,
      location: location);
}
