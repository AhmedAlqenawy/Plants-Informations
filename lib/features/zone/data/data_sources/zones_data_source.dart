import '../models/zones_list_model.dart';

abstract class ZonesDataSource {
  Future<ZonesListModel> getAllZones(int pageIndex);
}
