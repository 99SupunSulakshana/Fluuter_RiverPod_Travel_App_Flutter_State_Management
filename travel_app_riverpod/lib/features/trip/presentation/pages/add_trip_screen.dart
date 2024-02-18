import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app_riverpod/features/trip/domain/entities/trip.dart';
import 'package:travel_app_riverpod/features/trip/presentation/providers/trip_provider.dart';

class AddTripScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: "Trip title");
  final _descriptionController =
      TextEditingController(text: "Trip description");
  final _locationController = TextEditingController(text: "Trip location");
  final _pictureController = TextEditingController(
      text:
          "https://images.pexels.com/photos/1535162/pexels-photo-1535162.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  List<String> pictures = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(labelText: "Title"),
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: "Descrption"),
          ),
          TextFormField(
            controller: _locationController,
            decoration: InputDecoration(labelText: "Location"),
          ),
          TextFormField(
            controller: _pictureController,
            decoration: InputDecoration(labelText: "Photo"),
          ),
          ElevatedButton(
              onPressed: () {
                pictures.add(_pictureController.text);
                if (_formKey.currentState!.validate()) {
                  final newTrip = Trip(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      date: DateTime.now(),
                      location: _locationController.text,
                      photoes: pictures);
                  ref
                      .read(tripListNotifierProvider.notifier)
                      .addNewTrip(newTrip);
                  ref.watch(tripListNotifierProvider.notifier).loadTrips();
                }
              },
              child: const Text("Add trip"))
        ]),
      ),
    );
  }
}
