import 'package:client/core/database/hive_database.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../../../core/entity/datum/datum.model.dart';

SavedProfileListDao? savedProfileListDao;

class SavedProfileListDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  AvailableGigsDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box<Map>> openBox() =>
      HiveBoxes.openBox<Map>(HiveBoxes.listOfSavedProfile);

  Future<void> savedProfileList(List<Datum>? data) async {
    if (data!.isNotEmpty) await _box?.clear();

    final map = Map<String, Map>.fromIterable(
      data,
      key: (g) => (g as Datum).user!.id.toString(),
      value: (g) => (g as Datum).toJson(),
    );
    await _box?.putAll(map);
  }

  List<Datum> getConvertedData(Box box) {
    Map<String, dynamic> raw = Map<String, dynamic>.from(box.toMap());
    return raw.values.map((e) => Datum.fromJson(e)).toList();
  }

  Future<ValueListenable<Box>?> getListenable({List<String>? keys}) async {
    await openBox();
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future clearDb() async {
    await _box?.clear();
  }
}
