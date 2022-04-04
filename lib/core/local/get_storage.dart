import 'package:get_storage/get_storage.dart';

class GetStorageManager {
  static GetStorage getStorage = GetStorage();

  static const String darkmode = 'dark_mode';

  GetStorageManager();

  putValue(String key, bool value) => getStorage.write(key, value);

  getValue(String key) => getStorage.read(key);

  removeKey(String key) => getStorage.remove(key);

  removeAllKey() => getStorage.erase();
}
