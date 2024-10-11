import 'package:flutter/material.dart';
import 'package:ridewave/model/SpecialTrips.dart';
import 'package:ridewave/utils/AppColors.dart';
import 'package:ridewave/utils/format.dart';
import 'package:ridewave/widgets/Shimmer.dart';
import 'package:ridewave/widgets/ShimmerLoading.dart';

class SlicerCard extends StatelessWidget {
  const SlicerCard({super.key, required this.trip});


  final Alltrips trip;






  @override
  Widget build(BuildContext context) {



    DateTime currentDate = DateTime.now();
    DateTime tripDate = DateTime.parse(trip.date);

    // Calculate the difference in days
    int daysLeft = tripDate.difference(currentDate).inDays;

    String displayText;
    if (daysLeft > 0) {
      displayText = "$daysLeft days left";
    } else if (daysLeft == 0) {
      displayText = "Today is the day!";
    } else {
      displayText = "${daysLeft.abs()} days ago";
    }


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(12),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(trip.image),fit: BoxFit.fitHeight),
              color: Colors.grey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    children: [
                      Text(trip.seats,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: AppColors.dark
                        ),
                      ),
                      Text("Total Seats",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 6
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(

                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          color: AppColors.dark,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on,color: Colors.white,size: 10,),
                              Text(trip.toState,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10
                                ),
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(trip.description,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: Text("Going on ${formatDate(trip.date)}",
                                              style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.black38,
                                                  overflow: TextOverflow.ellipsis
                                              ),
                                            ),
                                          ),

                                          Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius: BorderRadius.circular(100)
                                            ),
                                            child: Text(displayText,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.sizeOf(context).height *0.04,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.black38,
                                      width: 1
                                    )
                                  )
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("From",
                                        style: TextStyle(
                                            fontSize: 12,
                                            overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                      Text("${ trip.fromState} to ${ trip.toState}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}


class ShimmerSliderCard extends StatelessWidget {
  const ShimmerSliderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Shimmer(
            linearGradient: AppColors.shimmerGradient,
            child: ShimmerLoading(
              isLoading: true,
              child: Container(
                padding: const EdgeInsets.all(12),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                color: Colors.grey,
              ),
            ),
          )
      ),
    );
  }
}
