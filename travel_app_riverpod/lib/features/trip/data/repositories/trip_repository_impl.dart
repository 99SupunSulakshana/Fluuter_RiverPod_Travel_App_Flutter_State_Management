import 'package:dartz/dartz.dart';
import 'package:travel_app_riverpod/core.error/failtures.dart';
import 'package:travel_app_riverpod/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_app_riverpod/features/trip/data/models/trip_model.dart';
import 'package:travel_app_riverpod/features/trip/domain/entities/trip.dart';
import 'package:travel_app_riverpod/features/trip/domain/repositories/trip_reporitories.dart';

class TripRepositoryImpl extends TripRepository {
  final TripLocalDataSource localDataSource;

  TripRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTrip(Trip trip) async {
    try {
      final tripModel = TripModel.fromEntity(trip);
      localDataSource.addTrip(tripModel);
    } catch (e) {
      print("Error - $e");
    }
  }

  @override
  Future<void> deleteTrip(int index) async {
    try {
      localDataSource.deleteTrip(index);
    } catch (e) {
      print("Error - $e");
    }
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      final tripModels = localDataSource.getTrips();
      List<Trip> res = tripModels.map((model) => model.toEntity()).toList();
      return Right(res);
    } catch (err) {
      return Left(SomeSpecificError(err.toString()));
    }
  }
}
