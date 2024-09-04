import 'package:uuid/uuid.dart';

class User {
  String id;
  String email;
  String password;
  Profile? profile;
  List<GenealogyTree> trees = [];
  DateTime createdAt;
  DateTime updatedAt;
  bool isAdmin;

  User({
    required this.email,
    required this.password,
    this.profile,
    this.trees = const [],
    DateTime? createdAt,
    DateTime? updatedAt,
    this.isAdmin = false,
  })  : id = const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  User copyWith({
    String? id,
    String? email,
    String? password,
    Profile? profile,
    List<GenealogyTree>? trees,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isAdmin,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
      profile: profile ?? this.profile,
      trees: trees ?? this.trees,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }
}

class Profile {
  String id;
  String firstName;
  String lastName;
  DateTime? birthDate;
  String userId;
  User user;

  Profile({
    required this.firstName,
    required this.lastName,
    this.birthDate,
    required this.user,
  })  : id = const Uuid().v4(),
        userId = user.id;
}

class Member {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime? birthDate;
  final DateTime? deathDate;
  final String treeId;
  final Member? parent;
  final List<Member> children;
  final int? sosaNumber;
  final int? pelissierNumber;

  Member({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.birthDate,
    this.deathDate,
    required this.treeId,
    this.parent,
    this.children = const [],
    this.sosaNumber,
    this.pelissierNumber,
  });

  // Méthode copyWith pour créer une copie modifiable
  Member copyWith({
    String? id,
    String? firstName,
    String? lastName,
    DateTime? birthDate,
    DateTime? deathDate,
    String? treeId,
    Member? parent,
    List<Member>? children,
    int? sosaNumber,
    int? pelissierNumber,
  }) {
    return Member(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      deathDate: deathDate ?? this.deathDate,
      treeId: treeId ?? this.treeId,
      parent: parent ?? this.parent,
      children: children ?? this.children,
      sosaNumber: sosaNumber ?? this.sosaNumber,
      pelissierNumber: pelissierNumber ?? this.pelissierNumber,
    );
  }
}

class GenealogyTree {
  final String id;
  final String name;
  final String? description;
  final String ownerId;
  final List<Member> members;
  final DateTime createdAt;
  final DateTime updatedAt;

  GenealogyTree({
    required this.id,
    required this.name,
    this.description,
    required this.ownerId,
    this.members = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  // Méthode copyWith pour créer une copie modifiable
  GenealogyTree copyWith({
    String? id,
    String? name,
    String? description,
    String? ownerId,
    List<Member>? members,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return GenealogyTree(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ownerId: ownerId ?? this.ownerId,
      members: members ??
          List.from(this.members), // Crée une copie modifiable de la liste
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
