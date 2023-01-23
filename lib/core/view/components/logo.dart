import 'package:flutter/material.dart';

import 'package:weight_tracker/core/extensions/num_extensions.dart';
import '../../resources/resources.dart';

class WTrackerLogo extends StatelessWidget {
  const WTrackerLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "W",
            style: TextStyle(
              color: AppColors.black,
              fontSize: FontSize.s48.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.bold,
            ),
          ),
          TextSpan(
            text: "Tracker",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: FontSize.s48.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeightManager.bold,
            ),
          ),
        ],
      ),
    );
  }
}
