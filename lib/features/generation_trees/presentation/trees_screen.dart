import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:faker/faker.dart';

Person generateFakePerson() {
  final faker = Faker();
  return Person(
    id: faker.guid.guid(),
    name: faker.person.name(),
  );
}

Person generateFakeTree(int depth, int breadth) {
  var root = generateFakePerson();
  if (depth > 0) {
    for (var i = 0; i < breadth; i++) {
      var child = generateFakeTree(depth - 1, breadth);
      root.children.add(child);
      child.father = root; // Assuming the root is the father for simplicity
    }
  }
  return root;
}

class Person {
  String id;
  String name;
  Person? father;
  Person? mother;
  List<Person> children;

  Person({
    required this.id,
    required this.name,
    this.father,
    this.mother,
    this.children = const [],
  }) {
    this.children = List.from(children);
  }
}

class FamilyTree extends StatefulWidget {
  const FamilyTree({super.key});

  @override
  State<FamilyTree> createState() => _FamilyTreeState();
}

class _FamilyTreeState extends State<FamilyTree> {
  final root = generateFakeTree(2, 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Tree'),
      ),
      body: SafeArea(
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.1,
          maxScale: 2.0,
          constrained: false,
          // child: GenealogyTreeCustomScreen(root: member3),
          child: FamilyTreeGraph(root: root),
        ),
      ),
    );
  }
}

class FamilyTreeGraph extends StatelessWidget {
  final Person root;

  const FamilyTreeGraph({super.key, required this.root});

  @override
  Widget build(BuildContext context) {
    final graph = Graph();
    final nodeMap = <String, Node>{};

    void addNode(Person person) {
      final node = Node.Id(person.id);
      nodeMap[person.id] = node;
      graph.addNode(node);
      if (person.father != null) {
        graph.addEdge(nodeMap[person.father!.id]!, node);
      }
      if (person.mother != null) {
        graph.addEdge(nodeMap[person.mother!.id]!, node);
      }
      for (var child in person.children) {
        addNode(child);
      }
    }

    addNode(root);

    final builder = BuchheimWalkerAlgorithm(
      BuchheimWalkerConfiguration()
        ..siblingSeparation = (30)
        ..levelSeparation = (100)
        ..subtreeSeparation = (100),
      TreeEdgeRenderer(BuchheimWalkerConfiguration()),
    );

    return GraphView(
      graph: graph,
      algorithm: builder,
      paint: Paint()
        ..color = Colors.green
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
      builder: (Node node) {
        final person = findPersonById(root, node.key!.value);
        return GestureDetector(
          onTap: () {
            // Handle tap event if needed
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              person?.name ?? 'Unknown',
              style: const TextStyle(fontSize: 12),
            ),
          ),
        );
      },
    );
  }

  Person? findPersonById(Person root, String id) {
    if (root.id == id) return root;
    for (var child in root.children) {
      final result = findPersonById(child, id);
      if (result != null) return result;
    }
    return null;
  }
}
