class Ancestor {
  final String name;
  final int id;
  final int parentId; // To establish relationships

  Ancestor(this.name, this.id, this.parentId);
}

List<Ancestor> ancestors = [
  Ancestor('You', 1, 0),
  Ancestor('Father', 2, 1),
  Ancestor('Mother', 3, 1),
  Ancestor('Paternal Grandfather', 4, 2),
  Ancestor('Paternal Grandmother', 5, 2),
  Ancestor('Maternal Grandfather', 6, 3),
  Ancestor('Maternal Grandmother', 7, 3),
];
