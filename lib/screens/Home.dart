import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridewave/provider/specilTrip_provider.dart';
import 'package:ridewave/provider/state_provider.dart';
import 'package:ridewave/utils/AppColors.dart';
import 'package:ridewave/utils/AppStyles.dart';
import 'package:ridewave/widgets/SliderCard.dart';
import 'package:ridewave/widgets/StateCard.dart';

class Home extends ConsumerWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final stateResponse = ref.watch(stateDataProvider);
    final SpecialTripResponse = ref.watch(specialTripsProvider);


    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              color: AppColors.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/ic_app.png",
                              scale: 2.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("RideWave",
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text("Tour place in INDIA",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                  stateResponse.when(
                    // Loading state
                    loading: () {
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height *0.25,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return const Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ShimmerStateCard(),
                              );
                            }
                        ),
                      );
                    },

                    // Error state
                    error: (error, stack) => Center(child: GestureDetector(
                        onTap: (){
                          throw stack;
                        },
                        child: Text('Error: $error'))
                    ),
                    data: (state){
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height *0.25,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: StateCard(
                                    name: state.data[index].state,
                                    image: state.data[index].image,
                                    count: state.data[index].count.toString()
                                ),
                              );
                            }
                        ),
                      );
                    },

                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ongoing Tour",
                    style: AppStyles.title,
                  ),
                  Text("View All",
                    style: AppStyles.viewButton,
                  ),
                ],
              ),
            ),

            SpecialTripResponse.when(

                error: (error, stack) => Center(child: GestureDetector(
                    onTap: (){
                      throw stack;
                    },
                    child: Text('Error: $error'))
                ),
                loading:()=> SizedBox(
                    height: MediaQuery.sizeOf(context).height*0.3,
                    child: const ShimmerSliderCard()
                ),
                data: (specialTrips){
                  return CarouselSlider(
                      items: specialTrips.alltrips.map((trip)=>
                          SlicerCard(
                            trip: trip,
                          )
                      ).toList(),
                      options: CarouselOptions(
                          height: MediaQuery.sizeOf(context).height*0.3,

                          viewportFraction: 1,
                          autoPlay: true,
                          padEnds: false
                      )
                  );
                },
            ),

          ],
        ),
      )
    );
  }
}
