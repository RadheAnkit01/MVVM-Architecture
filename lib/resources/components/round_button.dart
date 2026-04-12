import 'package:flutter/material.dart';
import 'package:mvvm/resources/colors.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool? loading;

  const RoundButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        width: 200,
        height: 40,
        child: Center(
          child: loading!
              ? CircularProgressIndicator(
                  color: AppColors.buttonTextColor,
                  padding: EdgeInsets.all(3),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: AppColors.buttonTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
