import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:plants_information/features/plants/domain/entities/plants_list_entity.dart';
import 'package:plants_information/features/plants/presentation/bloc/plants_cubit.dart';
import 'package:plants_information/utile/constants/route_keys.dart';
import 'package:plants_information/utile/extensions/num_converts.dart';

import '../../../../utile/component/loading_plants_shimmer_widget.dart';
import '../../../zone/presentation/pages/zones_page.dart';
import '../widgets/plant_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PlantsListEntity? plantsList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plants'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.toHeight,
          const ZonesPage(),
          8.toHeight,
          BlocConsumer<PlantsCubit, PlantsState>(
            listener: (context, state) {},
            builder: (context, state) {
              PlantsCubit cubit = PlantsCubit.get(context);

              if (state is PlantsInitial || state is RefreshingPlantsState) {
                cubit.getPlants();
              }
              if (state is LoadedPlantsState) {
                plantsList = cubit.plants;
              }
              return LazyLoadScrollView(
                onEndOfPage: (){
                  if (state is LoadingMorePlantsState == false) {
                    cubit.getMorePlants();
                  }
                },
                child: Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      cubit.refreshPlants();
                    },
                    child: state is PlantsInitial ||
                            state is LoadingPlantsState ||
                            state is RefreshingPlantsState
                        ? Padding(
                          padding:   EdgeInsets.symmetric(horizontal: 16.w),
                          child: const LoadingPlantsShimmerWidget(
                              isList: true,
                            ),
                        )
                        : state is ErrorPlantsState
                            ? ListView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                children: [
                                  Text("errrrrror ${state.message}"),
                                ],
                              )
                            : ConditionalBuilder(
                                condition: plantsList!.data!.isNotEmpty,
                                fallback: (context) => ListView(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  children: const [
                                    Text("errrrrror "),
                                  ],
                                ),
                                builder: (context) => ListView.builder(
                                  itemCount: plantsList!.data!.length,
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        PlantWidget(
                                          onTap: () {
                                            context.push('/$plantDetailsRoute',
                                                extra:
                                                    plantsList!.data![index]);
                                          },
                                          imgUrl: plantsList!
                                                  .data![index].imageUrl ??
                                              "",
                                          name: plantsList!
                                                  .data![index].commonName ??
                                              "N/A",
                                          year: plantsList!.data![index].year ==
                                                  null
                                              ? "N/A"
                                              : plantsList!.data![index].year
                                                  .toString(),
                                          status:
                                              plantsList!.data![index].status ??
                                                  "N/A",
                                        ),
                                        if (state is LoadingMorePlantsState &&
                                            index ==
                                                plantsList!.data!.length - 1)
                                          const LoadingPlantsShimmerWidget(
                                            isList: false,
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
