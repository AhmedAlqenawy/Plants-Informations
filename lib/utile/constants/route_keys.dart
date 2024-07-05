import 'package:go_router/go_router.dart';
import 'package:plants_information/features/plants/presentation/pages/home_page.dart';
import 'package:plants_information/features/plants/presentation/pages/plant_details_page.dart';

import '../../features/plants/domain/entities/plant_entity.dart';

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
