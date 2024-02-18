import 'package:travel_app_riverpod/features/trip/domain/repositories/trip_reporitories.dart';

class DeleteTrips {
  final TripRepository repository;

  DeleteTrips(this.repository);

  Future<void> call(int index) {
    return repository.deleteTrip(index);
  }
}
