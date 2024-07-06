import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:plants_information/features/plants/data/models/plant_model.dart';
import 'package:plants_information/features/plants/data/models/plants_list_model.dart';
import 'package:plants_information/features/plants/domain/entities/plants_list_entity.dart';

import '../../../../helpers/read_json.dart';

void main() {
  final PlantModel plants =
      plantsFromJson(readJson("helpers/dummy_data/plants_list.json"));

  group("test that Plants Model model work successfully", () {
    test("is PlantsModel is a PlantsEntity", () async {
      expect(plants.toEntity(), isA<PlantsListEntity>());
    });

    test(" PlantsListModel fromJson ", () async {
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dummy_data/plants_list.json'),
      );

      // act
      final result = PlantsListModel.fromJson(jsonMap);

      // assert
      expect(result, equals(plants));
    });
  });
}
