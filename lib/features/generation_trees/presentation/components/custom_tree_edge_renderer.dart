import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class CustomTreeEdgeRenderer extends TreeEdgeRenderer {
  CustomTreeEdgeRenderer() : super(BuchheimWalkerConfiguration());

  @override
  void render(Canvas canvas, Graph graph, Paint paint) {
    for (var node in graph.nodes) {
      var edges = graph.getInEdges(node);
      for (var edge in edges) {
        var sourcePosition = edge.source.position;
        var destinationPosition = edge.destination.position;

        paint.color = Colors.blueAccent;
        paint.strokeWidth = 2;

        canvas.drawLine(
          sourcePosition,
          destinationPosition,
          paint,
        );
      }
    }
  }
}
