import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../utile/component/loading_zones_shimmer_widget.dart';
import '../../../plants/presentation/bloc/plants_cubit.dart';
import '../../domain/entities/zones_list_entity.dart';
import '../bloc/zones_cubit.dart';
import '../widgets/zone_widget.dart';

class ZonesPage extends StatelessWidget {
  const ZonesPage({super.key});

  @override
  Widget build(BuildContext context) {
    ZonesListEntity? zonesList;
    String zoneId = "";
    return SizedBox(
      height: 39.h,
      child: BlocConsumer<ZonesCubit, ZonesState>(
        listener: (context, state) {},
        builder: (context, state) {
          ZonesCubit cubit = ZonesCubit.get(context);

          if (state is ZonesInitial || state is RefreshingZonesState) {
            cubit.getZones();
          }
          if (state is LoadedZonesState) {
            zonesList = cubit.zones;
          }
          if (state is ChangeSelectedZonesState) {
            zoneId = state.zoneId;
          }
          return LazyLoadScrollView(
            onEndOfPage: () {
              cubit.getMoreZones();
            },
            child: RefreshIndicator(
              onRefresh: () async {
                cubit.refreshZones();
              },
              child: state is ZonesInitial ||
                      state is LoadingZonesState ||
                      state is RefreshingZonesState
                  ? const LoadingZonesShimmerWidget()
                  : state is ErrorZonesState
                      ? ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            Text("errrrrror ${state.message}"),
                          ],
                        )
                      : ConditionalBuilder(
                          condition: zonesList!.data!.isNotEmpty,
                          fallback: (context) => ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: const [
                              Text("Empty "),
                            ],
                          ),
                          builder: (context) => ListView.builder(
                            itemCount: zonesList!.data!.length,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (index == 0)
                                    ZoneWidget(
                                      onTap: () {
                                        cubit.changeZones("");
                                        PlantsCubit.get(context)
                                            .changeZones("");
                                      },
                                      zoneName: "All",
                                      isSelected: zoneId == "",
                                    ),
                                  ZoneWidget(
                                    onTap: () {
                                      cubit.changeZones(zonesList!.data![index].slug ?? "");

                                      PlantsCubit.get(context).changeZones(
                                          zonesList!.data![index].slug ?? "");
                                    },
                                    zoneName:
                                        zonesList!.data![index].name ?? "NA",
                                    isSelected:
                                        zoneId == zonesList!.data![index].slug,
                                  ),

                                ],
                              );
                            },
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }
}
