import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:shopz_app/constant.dart';

class MongoDataBase {
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var collection = db.collection(COLLECTION_NAME);
    print(await collection.find().toList());
  }
}
