import 'package:flutter/material.dart';
import 'package:ridewave/model/TripsByState.dart';

class TripCardHorizontal extends StatelessWidget {
  final Data trip;

  const TripCardHorizontal({super.key,required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Trip Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                trip.image,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // Trip Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('State: ${trip.stateName}'),
                  const SizedBox(height: 8),
                  Text(
                    'Price: ${trip.price}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}