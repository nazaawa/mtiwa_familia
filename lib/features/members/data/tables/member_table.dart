import 'package:drift/drift.dart';
import 'package:mtiwa_familia/features/generation_trees/data/table/generalogy_trees.dart';
import 'package:uuid/uuid.dart';

@DataClassName('MemberModel')
class Members extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  DateTimeColumn get deathDate => dateTime().nullable()();
  TextColumn get treeId => text().references(GenealogyTrees, #id)();
  TextColumn get parentId => text().nullable().references(Members, #id)();
  IntColumn get sosaNumber => integer().nullable()();
  IntColumn get pelissierNumber => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
