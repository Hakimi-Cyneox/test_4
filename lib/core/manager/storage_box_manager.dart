import 'package:get_storage/get_storage.dart';

class StorageBoxManager {
  StorageBoxManager._privateConstructor();

  static final StorageBoxManager instance = StorageBoxManager._privateConstructor();
  GetStorage storage = GetStorage();

  // initialize storage box
  Future initialize() async {
    await GetStorage.init();
  }

  // write
  write(String storageKeyName, String data) {
    storage.write(storageKeyName, data);
  }

  // write int
  writeInt(String storageKeyName, int data) {
    storage.write(storageKeyName, data);
  }

  // read
  read(String storageKeyName) {
    var result = storage.read(storageKeyName);
    return result;
  }

  // remove
  remove({bool eraseAll = true, List<String>? keyList}) async {
    if (eraseAll) {
      storage.erase();
    } else {
      // remove by key value
      if (keyList != null && keyList.isNotEmpty) {
        for (var element in keyList) {
          storage.remove(element);
        }
      }
    }
  }
}
