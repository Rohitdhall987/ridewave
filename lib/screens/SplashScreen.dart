import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ridewave/repositories/user_repositries.dart';
import 'package:ridewave/repositories/version_repositries.dart';
import 'package:ridewave/utils/AppColors.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  final VersionRepository _repository=VersionRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  void check()async{

    bool updated=await _repository.isUpdateRequired();

    if(updated){
      loginCheck();
    }else{
      updateScreen();
    }

  }

  void updateScreen(){
    GoRouter.of(context).goNamed("Update");
  }

  void loginCheck(){
    UserRepository.isLoggedIn(context);
  }


  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      backgroundColor: AppColors.primary,
      body:  SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("RW",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 64
              ),
            ),
            Text("Ride Wave",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 24
              ),
            )
          ],
        ),
      ),
    );
  }
}
