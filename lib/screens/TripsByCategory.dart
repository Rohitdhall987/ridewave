import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ridewave/services/TripsByStateService.dart';
import 'package:ridewave/widgets/TripCardHorizontal.dart';

class TripsByCategory extends StatelessWidget {
  final String id;
  final String name;

  const TripsByCategory({super.key,required this.id,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: TripService.getTripsByCategory(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.alltrips.isEmpty) {
            return Center(child: Text('No trips available.'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: snapshot.data!.alltrips.length,
              itemBuilder: (context, index) {
                final trip = snapshot.data!.alltrips[index];
                return GestureDetector(
                    onTap: (){
                      print(trip.id.toString());
                      GoRouter.of(context).pushNamed("TripDetails",
                          pathParameters: {
                            'id':trip.id.toString()
                          }
                      );
                    },
                    child: TripCardHorizontal(title: trip.title,state: trip.fromState, price: trip.price,image: trip.image,)
                );
              },
            );
          }
        },
      ),
    );
  }
}

