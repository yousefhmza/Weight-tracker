import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker/core/view/components/error_component.dart';
import 'package:weight_tracker/modules/weights/cubits/weights_cubit.dart';
import 'package:weight_tracker/modules/weights/models/response/weight_model.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class AllWeightsScreen extends StatefulWidget {
  const AllWeightsScreen({Key? key}) : super(key: key);

  @override
  State<AllWeightsScreen> createState() => _AllWeightsScreenState();
}

class _AllWeightsScreenState extends State<AllWeightsScreen> {
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        appBar: const CustomAppbar(
          title: CustomText(AppStrings.pastRecords, fontSize: FontSize.s18, fontWeight: FontWeightManager.bold),
        ),
        body: StreamBuilder<List<WeightModel>>(
          stream: BlocProvider.of<WeightsCubit>(context).weightsStream(),
          builder: (BuildContext context, AsyncSnapshot<List<WeightModel>> snapshot) {
            if (snapshot.hasError) {
              return ErrorComponent(message: AppStrings.error, onRetry: () => setState(() {}));
            }

            if (snapshot.connectionState == ConnectionState.waiting) return const LoadingSpinner();

            return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: CustomText(
                  "${snapshot.data![index].weight} ${AppStrings.kg}",
                  fontWeight: FontWeightManager.bold,
                ),
                subtitle: CustomText(
                  DateFormat("yyyy-MM-dd hh:mm a").format(DateTime.parse(snapshot.data![index].date)),
                  color: AppColors.grey,
                ),
              ),
              separatorBuilder: (context, index) => const VerticalSpace(AppSize.s12),
              itemCount: snapshot.data!.length,
            );
          },
        ),
      ),
    );
  }
}
