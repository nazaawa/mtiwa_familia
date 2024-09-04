import 'package:drift/drift.dart';
import 'package:mtiwa_familia/features/profil/data/table/user_table.dart';
import 'package:uuid/uuid.dart';

@DataClassName('GenealogyTreeModel')
class GenealogyTrees extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get ownerId => text().references(Users, #id)();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}
