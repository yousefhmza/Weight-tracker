import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weight_tracker/config/navigation/navigation.dart';

import 'package:weight_tracker/core/resources/resources.dart';
import 'package:weight_tracker/core/utils/alerts.dart';
import 'package:weight_tracker/core/view/views.dart';
import 'package:weight_tracker/modules/auth/cubits/sign_in_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  Lottie.asset(AppLottie.signInLottie, width: deviceHeight * 0.4, repeat: false),
                  const VerticalSpace(AppSize.s36),
                  BlocConsumer<SignInCubit, SignInStates>(
                    listener: (context, state) {
                      if (state is SignInFailureState) Alerts.showSnackBar(context, state.failure.message);
                      if (state is SignInSuccessState) NavigationService.pushReplacementAll(context, Routes.homeScreen);
                    },
                    builder: (context, state) => state is SignInLoadingState
                        ? const LoadingSpinner()
                        : CustomButton(
                            width: double.infinity,
                            text: AppStrings.signInAnonymously,
                            onPressed: () => BlocProvider.of<SignInCubit>(context).signInAnonymously(),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
