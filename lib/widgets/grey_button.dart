import 'package:flutter/material.dart';

import '../product/style.dart';

class GreyButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;
  const GreyButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: AppColors.grey,
          child: Column(
            children: [
              Icon(icon, color: AppColors.darkBlue),
              const SizedBox(height: 5),
              Text(
                text,
                style: TextStyles.bodySmallBold.copyWith(
                  color: AppColors.darkBlue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
