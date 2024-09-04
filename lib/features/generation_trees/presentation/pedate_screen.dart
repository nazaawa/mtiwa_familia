import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:mtiwa_familia/features/members/presentation/components/member_card.dart';

class PedigreeTreeScreen extends StatelessWidget {
  const PedigreeTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Graph graph = Graph()..isTree = true;
    final rootNode = Node.Id('root');

    graph.addEdge(rootNode, Node.Id('child1'));
    graph.addEdge(rootNode, Node.Id('child2'));

    final builder = BuchheimWalkerConfiguration();

    return Scaffold(
      appBar: AppBar(title: const Text('Pedigree')),
      body: InteractiveViewer(
        constrained: false,
        boundaryMargin: const EdgeInsets.all(8.0),
        minScale: 0.01,
        maxScale: 5.6,
        child: GraphView(
          graph: graph,
          algorithm:
              BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
          builder: (Node node) {
            var id = node.key!.value as String;
            return MemberCard(
              firstName: 'John',
              lastName: 'Doe',
              birthYear: '1980',
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ajouter une action pour agrandir l'arbre
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_neutral), label: 'Tree'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.recent_actors), label: 'Recents'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}
