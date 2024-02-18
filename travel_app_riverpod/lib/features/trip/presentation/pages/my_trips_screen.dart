import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_app_riverpod/features/trip/presentation/providers/trip_provider.dart';
import 'package:travel_app_riverpod/features/trip/presentation/widgets/travel_card.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsList = ref.watch(tripListNotifierProvider);

    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: tripsList.length,
              itemBuilder: ((context, index) {
                final trip = tripsList[index];
                return TravelCard(
                    imageUrl: trip.photoes[index],
                    title: trip.title,
                    description: trip.description,
                    date: DateFormat.yMMMEd().format(trip.date).toString(),
                    location: trip.location,
                    onDelete: () {
                      ref
                          .read(tripListNotifierProvider.notifier)
                          .removeTrip(index);
                      ref.read(tripListNotifierProvider.notifier).loadTrips();
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
