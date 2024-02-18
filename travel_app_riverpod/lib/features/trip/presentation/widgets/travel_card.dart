import 'package:flutter/material.dart';

class TravelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  final String location;
  final VoidCallback onDelete;

  TravelCard(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.date,
      required this.location,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                imageUrl,
                height: 70,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black),
                    ),
                    IconButton(
                        onPressed: () {
                          onDelete();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
