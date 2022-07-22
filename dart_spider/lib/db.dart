import 'dart:ffi';
import 'dart:io';
import 'package:sqlite3/open.dart';
import 'package:sqlite3/sqlite3.dart';

import 'spider_model.dart';

const _createTableSql = '''
create table if not exists blog (
  id integer primary key autoincrement,
  title text,
  content text,
  thumbnail text
);
''';

class Sqlite3Db {
  late Database _db;
  Sqlite3Db() {
    _prepareDb();
    _createTable();
  }

  void _prepareDb() {
    //use custom sqlite3 env
    open.overrideFor(
      OperatingSystem.macOS,
      () => DynamicLibrary.open(
        '${File(Platform.script.path).parent.path}/sqlite3',
      ),
    );
    _db = sqlite3.open('db/data.db');
  }

  void _createTable() => _db.execute(_createTableSql);

  void saveData(List<SpiderModel> data) {
    final insertSql = _db.prepare('insert into blog values (null,?,?,?)');
    for (var e in data) {
      insertSql.execute([e.title, e.content, e.thumbnail]);
    }
    insertSql.dispose();
  }
}
