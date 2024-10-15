import 'package:flutter/material.dart';
import 'package:ridewave/model/TripsByCategory.dart';
import 'package:ridewave/utils/AppColors.dart';
import 'package:ridewave/widgets/Shimmer.dart';
import 'package:ridewave/widgets/ShimmerLoading.dart';


class TripCard extends StatelessWidget {
  const TripCard({super.key,required this.trip});

  final  Trips trip;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(trip.image),fit: BoxFit.fitHeight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.black
                ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: Center(
                child: Text(trip.title,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class TripCardShimmer extends StatelessWidget {
  const TripCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child:  Shimmer(
          linearGradient: AppColors.shimmerGradient,
        child: ShimmerLoading(isLoading: true, child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.grey,
        )),
      ),
    );
  }
}

