import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mtiwa_familia/core/data/database.dart';

import '../table/generalogy_trees.dart';

part 'genealogy_tree_dao.g.dart';

@injectable
@DriftAccessor(tables: [GenealogyTrees])
class GenealogyTreeDao extends DatabaseAccessor<AppDatabase>
    with _$GenealogyTreeDaoMixin {
  final AppDatabase db;

  GenealogyTreeDao(this.db) : super(db);

  Future<List<GenealogyTreeModel>> getAllTrees() =>
      select(genealogyTrees).get();

  Stream<List<GenealogyTreeModel>> watchAllTrees() =>
      select(genealogyTrees).watch();

  Future<int> insertTree(GenealogyTreeModel tree) =>
      into(genealogyTrees).insert(tree);

  Future<bool> updateTree(GenealogyTreeModel tree) =>
      update(genealogyTrees).replace(tree);

  Future<int> deleteTree(GenealogyTreeModel tree) =>
      delete(genealogyTrees).delete(tree);
}
