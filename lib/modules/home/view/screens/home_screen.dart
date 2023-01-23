import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weight_tracker/config/navigation/navigation.dart';

import 'package:weight_tracker/core/resources/resources.dart';
import 'package:weight_tracker/core/utils/alerts.dart';
import 'package:weight_tracker/core/view/views.dart';
import 'package:weight_tracker/modules/home/cubits/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        appBar: const CustomAppbar(
          title: CustomText(AppStrings.weightTracker, fontSize: FontSize.s18, fontWeight: FontWeightManager.bold),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              Lottie.asset(AppLottie.weightLottie, width: deviceWidth * 0.7),
              const VerticalSpace(AppSize.s36),
              const CustomText(AppStrings.enterWeight, fontSize: FontSize.s16, fontWeight: FontWeightManager.semiBold),
              const VerticalSpace(AppSize.s36),
              CustomTextField(
                hintText: AppStrings.weightInKg,
                formatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) => BlocProvider.of<HomeCubit>(context).weightBody.copyWith(weight: value),
                suffix: const CustomText(AppStrings.kg, color: AppColors.grey),
                prefix: const CustomIcon(Icons.monitor_weight_outlined),
              ),
              const VerticalSpace(AppSize.s36),
              BlocConsumer<HomeCubit, HomeStates>(
                listener: (context, state) {
                  if (state is RecordWeightFailureState) Alerts.showSnackBar(context, state.failure.message);
                  if (state is RecordWeightSuccessState) Alerts.showToast(state.message);
                },
                builder: (context, state) => state is RecordWeightLoadingState
                    ? const LoadingSpinner()
                    : CustomButton(
                        width: double.infinity,
                        text: AppStrings.saveWeight,
                        onPressed: () {
                          BlocProvider.of<HomeCubit>(context).weightBody.copyWith(
                                date: DateTime.now().toIso8601String(),
                              );
                          BlocProvider.of<HomeCubit>(context).recordWeight();
                        },
                      ),
              ),
              const VerticalSpace(AppSize.s16),
              CustomButton(
                width: double.infinity,
                text: AppStrings.viewRecords,
                color: AppColors.primary,
                onPressed: () => NavigationService.push(context, Routes.allWeightsScreen),
              )
            ],
          ),
        ),
      ),
    );
  }
}
