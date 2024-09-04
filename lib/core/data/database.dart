import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:mtiwa_familia/features/generation_trees/data/table/generalogy_trees.dart';
import 'package:mtiwa_familia/features/members/data/tables/member_table.dart';
import 'package:mtiwa_familia/features/profil/data/table/profil_table.dart';
import 'package:mtiwa_familia/features/profil/data/table/user_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

part 'database.g.dart';

@injectable
@DriftDatabase(tables: [Users, Profiles, Members, GenealogyTrees])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
