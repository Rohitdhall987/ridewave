import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ridewave/services/TripDetailsService.dart';
import 'package:ridewave/utils/AppButton.dart';
import 'package:ridewave/utils/AppColors.dart';
import 'package:ridewave/utils/html.dart';


class TripDetails extends StatelessWidget {
  const TripDetails({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: TripDetailsService.getTripDetails(id),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.hasError){
              return Center(
                  child: GestureDetector(
                    onTap: (){
                      throw snapshot.error.toString();
                    },
                     child: Text(snapshot.error.toString())
              )
              );
            }
            if(snapshot.data == null){
              return Center(
                child: Text("null data returned"),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(snapshot.data!.image),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(snapshot.data!.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        Text("${snapshot.data!.fromState} to ${snapshot.data!.toState}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const Text("Seats"),
                                Text(snapshot.data!.seats,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.dark,
                                      fontSize: 22
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text("Per Person"),
                                Text(snapshot.data!.price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.dark,
                                      fontSize: 22
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        Text("Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        htmlWidget(htmlContent: snapshot.data!.description),

                        SizedBox(
                          height: 16,
                        ),

                        appButton(text: "Book", callBack: (){
                          GoRouter.of(context).pushNamed("QueryForm",
                            pathParameters: {
                              "id": id
                            }
                          );
                        }),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}

