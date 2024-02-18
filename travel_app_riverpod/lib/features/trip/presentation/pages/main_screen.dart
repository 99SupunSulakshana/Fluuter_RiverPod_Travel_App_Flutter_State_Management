import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app_riverpod/features/trip/presentation/pages/add_trip_screen.dart';
import 'package:travel_app_riverpod/features/trip/presentation/pages/my_trips_screen.dart';
import 'package:travel_app_riverpod/features/trip/presentation/providers/trip_provider.dart';

class MainScreen extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tripListNotifierProvider.notifier).loadTrips();
    _pageController.addListener(() {
      _currentNotifier.value = _pageController.page!.round();
    });

    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Flutter Developer 🔥",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "Travelling Today ?",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            backgroundColor: Colors.blueAccent),
        body: PageView(
          controller: _pageController,
          children: [const MyTripsScreen(), AddTripScreen(), const Text('3')],
        ),
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: _currentNotifier,
            builder: (context, pageIndex, child) {
              return BottomNavigationBar(
                currentIndex: pageIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: "My Trips"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add), label: "Add Trips"),
                  BottomNavigationBarItem(icon: Icon(Icons.map), label: "Maps"),
                ],
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
              );
            }));
  }
}
