import 'package:flutter/material.dart';

class MyInteractiveViewer extends StatefulWidget {
  final Widget child;

  const MyInteractiveViewer({super.key, required this.child});

  @override
  _MyInteractiveViewerState createState() => _MyInteractiveViewerState();
}

class _MyInteractiveViewerState extends State<MyInteractiveViewer> {
  final TransformationController _transformationController =
      TransformationController();

  void _resetView() {
    _transformationController.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Interactive Viewer'),
        actions: const [],
      ),
      body: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              transformationController: _transformationController,
              boundaryMargin: const EdgeInsets.all(double.infinity),
              minScale: 0.1,
              maxScale: 5.0,
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
