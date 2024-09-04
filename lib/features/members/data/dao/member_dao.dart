import 'package:drift/drift.dart';
import 'package:mtiwa_familia/core/data/database.dart';
import 'package:mtiwa_familia/features/members/data/tables/member_table.dart';

part 'member_dao.g.dart';

@DriftAccessor(tables: [Members])
class MemberDao extends DatabaseAccessor<AppDatabase> with _$MemberDaoMixin {
  final AppDatabase db;

  MemberDao(this.db) : super(db);

  Future<List<MemberModel>> getAllMembers() => select(members).get();

  Stream<List<MemberModel>> watchAllMembers() => select(members).watch();

  Future<int> insertMember(MemberModel member) => into(members).insert(member);

  Future<bool> updateMember(MemberModel member) =>
      update(members).replace(member);

  Future<int> deleteMember(MemberModel member) =>
      delete(members).delete(member);
}
