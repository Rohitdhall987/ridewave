import 'package:flutter/material.dart';
import 'package:ridewave/utils/AppColors.dart';

Widget appButton({required String text, required VoidCallback callBack}) {
  return GestureDetector(
    onTap: callBack,
    child: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
