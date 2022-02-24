import 'dart:convert';

import 'package:client/core/database/hive_database.dart';
import 'package:client/core/helper/configs/instances.dart';
import 'package:client/views/dashboard/gig/data/model/list_of_artisan_response/datum.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';


SavedGigDao? savedGigDao;

class SavedGigDao {
  Box<Map>? _box;

  Box<Map>? get box => _box;

  SavedGigDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box<Map>> openBox() => HiveBoxes.openBox<Map>(HiveBoxes.savedGig);

  Future<void> savedGigList(List<Datum>? data) async {
    if (data!.isNotEmpty) await _box?.clear();
    logger.d('messageid dadtabase $data');

    final map = Map<String, Map>.fromIterable(
      data,
      key: (g) => (g as Datum).user!.id.toString(),
      value: (g) => (g as Datum).toJson(),
    );
    await _box!.putAll(map);
  }

  List<Datum> getConvertedData(Box box) {
    Map<String, dynamic> raw = Map<String, dynamic>.from(box.toMap());
    return raw.values
        .map((e) => Datum.fromJson(json.decode(json.encode(e))))
        .toList();
  }

  Future<ValueListenable<Box>?> getListenable({List<String>? keys}) async {
    await openBox();
    return keys == null ? _box?.listenable() : _box?.listenable(keys: keys);
  }

  Future clearDb() async {
    await _box?.clear();
  }
}