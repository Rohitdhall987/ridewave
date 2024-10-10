import 'package:flutter/material.dart';
import 'package:ridewave/utils/AppColors.dart';
import 'package:ridewave/widgets/Shimmer.dart';
import 'package:ridewave/widgets/ShimmerLoading.dart';

class StateCard extends StatelessWidget {
  final String name;
  final String image;
  final String count;
  const StateCard({super.key,required this.name,required this.image,required this.count,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width *0.4,
      padding:const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.network(image,
            fit: BoxFit.fitHeight,
          )),
          Text(name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Center(child: Text(count)),
              ),
              SizedBox(
                width: 4,
              ),
              Text("Places")
            ],
          )
        ],
      ),
    );
  }
}


class ShimmerStateCard extends StatefulWidget {
  const ShimmerStateCard({super.key});

  @override
  State<ShimmerStateCard> createState() => _ShimmerStateCardState();
}

class _ShimmerStateCardState extends State<ShimmerStateCard> {
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: AppColors.shimmerGradient,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width *0.4,
            padding:const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container(
                  color: Colors.grey.shade200,
                )),
                Text("loading..",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(child: Text("?")),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text("Places")
                  ],
                )
              ],
            ),
          ),
          ShimmerLoading(isLoading: true, child: Container(
            height: double.maxFinite,
            width: MediaQuery.sizeOf(context).width *0.4,
            color: Colors.blue.withOpacity(0.5),
          )),

        ],
      ),
    );
  }
}

