import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridewave/provider/specilTrip_provider.dart';
import 'package:ridewave/provider/state_provider.dart';
import 'package:ridewave/provider/tripByCategory_provider.dart';
import 'package:ridewave/utils/AppColors.dart';
import 'package:ridewave/utils/AppStyles.dart';
import 'package:ridewave/widgets/SliderCard.dart';
import 'package:ridewave/widgets/StateCard.dart';
import 'package:ridewave/widgets/TripCard.dart';

class Home extends ConsumerWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final stateResponse = ref.watch(stateDataProvider);
    final specialTripResponse = ref.watch(specialTripsProvider);
    final tripsByCategoryResponse = ref.watch(tripsByCategoryProvider);


    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
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
                                      padding:  EdgeInsets.all(8.0),
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
                                      child: GestureDetector(
                                        onTap: (){
                                          GoRouter.of(context).pushNamed("TripsByState",
                                            pathParameters: {
                                              "stateName":state.data[index].state
                                            }
                                          );
                                        },
                                        child: StateCard(
                                            name: state.data[index].state,
                                            image: state.data[index].image,
                                            count: state.data[index].count.toString()
                                        ),
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

                  specialTripResponse.when(

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
                              GestureDetector(
                                onTap: (){
                                  GoRouter.of(context).pushNamed("QueryForm",
                                    queryParameters: {
                                      "id":trip.id.toString()
                                    }
                                  );
                                },
                                child: SlicerCard(
                                  trip: trip,
                                ),
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

                  const SizedBox(
                    height: 16,
                  ),

                  tripsByCategoryResponse.when(

                      error: (error, stack) => Center(child: GestureDetector(
                          onTap: (){
                            throw stack;
                          },
                          child: Text('Error: $error'))
                      ),
                      loading:(){
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.9,
                          child: ListView.builder(
                            physics:const  NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context,index){
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: MediaQuery.sizeOf(context).height * 0.03,
                                      width: MediaQuery.sizeOf(context).width * 0.5,
                                      child: const TripCardShimmer(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height * 0.3,

                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics:  const NeverScrollableScrollPhysics(),
                                        itemCount: 3,
                                        itemBuilder:(context,index){
                                          return  Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                              child: const TripCardShimmer()
                                            ),
                                          );
                                        }
                                    ),
                                  )
                                ],
                              );
                              }
                          ),
                        );
                      },

                    data: (tripsByCategory){
                      return Column(
                        children: tripsByCategory.allcategory.map(
                                (category)=>Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(category.title,
                                        style: AppStyles.title,
                                      ),
                                      Text("View All",
                                        style: AppStyles.viewButton,
                                      ),

                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.sizeOf(context).height*0.3,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: category.trips.length,
                                      itemBuilder: (context,index){
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: (){
                                              GoRouter.of(context).pushNamed("TripDetails",
                                                pathParameters: {
                                                  "id":category.trips[index].id.toString()
                                                }
                                              );
                                            },
                                            child: SizedBox(
                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                width: MediaQuery.sizeOf(context).width * 0.5,
                                                child: TripCard(trip: category.trips[index])
                                            ),
                                          ),
                                        );
                                      }
                                  ),
                                )
                              ],
                            )
                        ).toList(),
                      );
                    },
                  )
                ]
              ),
            )
          ],
        ),
      )
    );
  }
}
