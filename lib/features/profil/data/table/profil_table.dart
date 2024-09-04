import 'package:drift/drift.dart';
import 'package:mtiwa_familia/features/profil/data/table/user_table.dart';
import 'package:uuid/uuid.dart';

@DataClassName('ProfileModel')
class Profiles extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  TextColumn get userId => text().references(Users, #id)();

  @override
  Set<Column> get primaryKey => {id};
}
