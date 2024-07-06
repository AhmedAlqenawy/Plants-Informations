import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:plants_information/features/plants/data/models/plants_list_model.dart';
import 'package:plants_information/features/plants/domain/entities/plants_list_entity.dart';

import '../../../../helpers/read_json.dart';

void main() {
  final plantsList =
      plantsListFromJson(readJson("helpers/dummy_data/plants_list.json"));

  group("test that Plants List Model model work successfully", () {
    test("is PlantsListModel is a PlantsListEntity", () async {
      expect(plantsList.toEntity(), isA<PlantsListEntity>());
    });

    test(" PlantsListModel fromJson ", () async {
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dummy_data/plants_list.json'),
      );

      // act
      final result = PlantsListModel.fromJson(jsonMap);

      // assert
      expect(result, equals(plantsList));
    });
  });
}
