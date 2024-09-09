import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphview/GraphView.dart';
import 'package:faker/faker.dart';
import 'package:mtiwa_familia/features/generation_trees/presentation/components/custom_node.dart';

import 'components/tree_view_method.dart';

class GenealogyTreeWidget extends StatefulWidget {
  const GenealogyTreeWidget({super.key});

  @override
  State<GenealogyTreeWidget> createState() => _GenealogyTreeWidgetState();
}

class _GenealogyTreeWidgetState extends State<GenealogyTreeWidget> {
  final Graph graph = Graph();
  final Faker faker = Faker();

  final TransformationController _transformationController =
      TransformationController();

  Node? _highlightedNode;
  String _selectedMethod = 'Sosa';

  void _resetView() {
    _transformationController.value = Matrix4.identity();
  }

  @override
  void initState() {
    super.initState();
    generateSosaTree();
  }

  void generateSosaTree() {
    //   graph.clear();
    Node root = Node.Id(faker.person.name());
    graph.addNode(root);

    List<Node> currentLevel = [root];
    for (int i = 0; i < 5; i++) {
      List<Node> nextLevel = [];
      for (var node in currentLevel) {
        Node father = Node.Id(faker.person.name());
        Node mother = Node.Id(faker.person.name());
        graph.addEdge(node, father);
        graph.addEdge(node, mother);
        nextLevel.add(father);
        nextLevel.add(mother);
      }
      currentLevel = nextLevel;
    }
  }

  void generatePelissierTree() {
    //  graph.clear();
    Node root = Node.Id(faker.person.name());
    graph.addNode(root);

    List<Node> currentLevel = [root];
    for (int i = 0; i < 8; i++) {
      List<Node> nextLevel = [];
      for (var node in currentLevel) {
        Node child1 = Node.Id(faker.person.name());
        Node child2 = Node.Id(faker.person.name());
        graph.addEdge(node, child1);
        graph.addEdge(node, child2);
        nextLevel.add(child1);
        nextLevel.add(child2);
      }
      currentLevel = nextLevel;
    }
  }

  void _searchUser(String query) {
    setState(() {
      _highlightedNode = null;
      for (var node in graph.nodes) {
        if (node.key.toString().toLowerCase() == query.toLowerCase()) {
          _highlightedNode = node;
          break;
        }
      }
    });
  }

  void _changeMethod(String? value) {
    setState(() {
      _selectedMethod = value!;
      if (_selectedMethod == 'Sosa') {
        generateSosaTree();
      } else if (_selectedMethod == 'Pelissier') {
        generatePelissierTree();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100.withOpacity(0.3),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetView,
        child: const Icon(Icons.restore),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 10,
        centerTitle: true,
        leading: const Icon(Icons.menu),
        shadowColor: Colors.black26,
        title: const Column(
          children: [
            Text(
              'Andedi Family tree',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            Text(
              '9 personnes',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              showFamilyTreeViewOptions(
                  context, _selectedMethod, _changeMethod);
            },
            icon: Container(
              padding: const EdgeInsets.all(7),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              child: const FaIcon(
                FontAwesomeIcons.sitemap,
                size: 10,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InteractiveViewer(
              transformationController: _transformationController,
              boundaryMargin: const EdgeInsets.all(double.infinity),
              constrained: false,
              minScale: 0.1,
              maxScale: 5.0,
              child: Center(
                child: GraphView(
                  graph: graph,
                  algorithm: BuchheimWalkerAlgorithm(
                    BuchheimWalkerConfiguration()
                      ..siblingSeparation = 20
                      ..levelSeparation = 70
                      ..orientation =
                          BuchheimWalkerConfiguration.ORIENTATION_BOTTOM_TOP,
                    TreeEdgeRenderer(BuchheimWalkerConfiguration()),
                  ),
                  paint: Paint()
                    ..color = Colors.green
                    ..strokeWidth = 1
                    ..isAntiAlias = true,
                  builder: (Node node) {
                    String nodeKey = node.key.toString();
                    bool isHighlighted = node == _highlightedNode;
                    return CustomNode(
                      key: node.key!,
                      name: nodeKey,
                      isHighlighted: isHighlighted,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
