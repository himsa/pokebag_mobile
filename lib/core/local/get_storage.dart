import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageManager {
  static GetStorage getStorage = GetStorage('PokeBagStorage');

  static const String darkmode = 'dark_mode';
  static const String pokebagKey = 'poke_bag';

  putValue(String key, bool value) => getStorage.write(key, value);

  getValue(String key) => getStorage.read(key);

  removeKey(String key) => getStorage.remove(key);

  removeAllKey() => getStorage.erase();

  saveList(String storageKey, List<dynamic> storageValue) async {
    await getStorage.write(storageKey, jsonEncode(storageValue));
    debugPrint(jsonEncode(storageValue));
  }

  readList(String storageKey) => getStorage.read(storageKey);
}
