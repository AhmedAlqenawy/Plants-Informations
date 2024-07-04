import 'package:go_router/go_router.dart';
import 'package:plants_information/features/home/presentation/pages/home_page.dart';
import 'package:plants_information/features/plant_details/presentation/pages/plant_details_page.dart';

import '../../features/home/domain/entities/plant_entity.dart';

const homeRoute = 'home';
const plantDetailsRoute = 'plant_details';

final GoRouter appRoute = GoRouter(
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      name: homeRoute,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/$plantDetailsRoute",
      name: plantDetailsRoute,
      builder: (context, state) {
        final data = state.extra;

        return PlantDetailsPage(
          plantEntity: data as PlantEntity,
        );
      },
    ),
  ],
);
