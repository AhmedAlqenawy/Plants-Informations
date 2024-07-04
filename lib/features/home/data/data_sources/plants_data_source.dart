import '../models/plants_list_model.dart';

abstract class PlantsDataSource {
  Future<PlantsListModel> getAllPlants();
}
