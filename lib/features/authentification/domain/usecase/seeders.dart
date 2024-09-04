import 'package:faker/faker.dart';
import 'package:mtiwa_familia/features/authentification/domain/models/users.dart';

class Seeder {
  static final faker = Faker();

  static Member seedMember(
      {Member? parent, String? treeId, int depth = 0, int maxDepth = 3}) {
    // Arrêter la récursion lorsque la profondeur maximale est atteinte
    if (depth >= maxDepth) {
      return Member(
        id: faker.guid.guid(),
        firstName: faker.person.firstName(),
        lastName: faker.person.lastName(),
        birthDate: faker.date.dateTime(minYear: 1900, maxYear: 2020),
        treeId: treeId ?? faker.guid.guid(),
        parent: parent,
        children: [],
      );
    }

    final member = Member(
      id: faker.guid.guid(),
      firstName: faker.person.firstName(),
      lastName: faker.person.lastName(),
      birthDate: faker.date.dateTime(minYear: 1900, maxYear: 2020),
      treeId: treeId ?? faker.guid.guid(),
      parent: parent,
      children: [],
    );

    // Ajouter des enfants pour le membre
    final children = List.generate(
      faker.randomGenerator.integer(3, min: 1),
      (index) => seedMember(
          parent: member, treeId: treeId, depth: depth + 1, maxDepth: maxDepth),
    );

    // Utiliser copyWith pour s'assurer que la liste est modifiable
    return member.copyWith(children: children);
  }

  static GenealogyTree seedGenealogyTree() {
    final tree = GenealogyTree(
      id: faker.guid.guid(),
      name: faker.lorem.words(2).join(' '),
      description: faker.lorem.sentence(),
      ownerId: faker.guid.guid(),
      members: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Générer les membres racines du tree
    final members = List.generate(
      faker.randomGenerator.integer(2, min: 1),
      (index) => seedMember(treeId: tree.id, maxDepth: 3),
    );

    // Utiliser copyWith pour mettre à jour les membres avec une liste modifiable
    return tree.copyWith(members: members);
  }

  static User seedUser() {
    final user = User(
      email: faker.internet.email(),
      password: faker.internet.password(),
      profile: null,
      trees: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isAdmin: faker.randomGenerator.boolean(),
    );

    // Générer des arbres généalogiques pour l'utilisateur
    final trees = List.generate(
      faker.randomGenerator.integer(2, min: 1),
      (index) => seedGenealogyTree(),
    );

    // Utiliser copyWith pour mettre à jour les arbres avec une liste modifiable
    return user.copyWith(trees: trees);
  }
}
