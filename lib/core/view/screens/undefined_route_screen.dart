import 'package:flutter/material.dart';

import 'package:weight_tracker/core/resources/resources.dart';
import '../widgets/custom_text.dart';
import '../widgets/status_bar.dart';

class UndefinedRouteScreen extends StatelessWidget {
  const UndefinedRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StatusBar(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: CustomText(AppStrings.noRouteFound, fontSize: FontSize.s20, fontWeight: FontWeightManager.bold),
          ),
        ),
      ),
    );
  }
}
