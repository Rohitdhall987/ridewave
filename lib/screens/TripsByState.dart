import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ridewave/services/TripsByStateService.dart';
import 'package:ridewave/widgets/TripCardHorizontal.dart';

class TripsByState extends StatelessWidget {
  final String stateName;

  const TripsByState({super.key,required this.stateName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stateName),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: TripByStateService.getTrips(stateName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
            return Center(child: Text('No trips available.'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                final trip = snapshot.data!.data[index];
                return GestureDetector(
                    onTap: (){
                      print(trip.id.toString());
                      GoRouter.of(context).pushNamed("TripDetails",
                        pathParameters: {
                        'id':trip.id.toString()
                        }
                      );
                    },
                    child: TripCardHorizontal(trip: trip)
                );
              },
            );
          }
        },
      ),
    );
  }
}

