import 'package:flutter/material.dart';

class ZoomableWidget extends StatefulWidget {
  final Widget child;
  final double minScale;
  final double maxScale;

  const ZoomableWidget({
    super.key,
    required this.child,
    this.minScale = 0.5,
    this.maxScale = 3.0,
  });

  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  Offset _offset = Offset.zero;
  Offset _previousOffset = Offset.zero;

  void _reset() {
    setState(() {
      _scale = 1.0;
      _offset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onScaleStart: (details) {
            _previousScale = _scale;
            _previousOffset = _offset;
          },
          onScaleUpdate: (details) {
            setState(() {
              // Update scale with clamping
              _scale = (_previousScale * details.scale)
                  .clamp(widget.minScale, widget.maxScale);

              // Update offset based on the new scale
              final scaleDiff = _scale / _previousScale;
              _offset = _previousOffset * scaleDiff +
                  details.focalPoint -
                  (details.focalPoint * scaleDiff);
            });
          },
          onScaleEnd: (details) {
            // Reset previous scale and offset for the next gesture
            _previousScale = _scale;
            _previousOffset = _offset;
          },
          child: Transform.scale(
            scale: _scale,
            child: Transform.translate(
              offset: _offset,
              child: widget.child,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            onPressed: _reset,
            child: const Icon(Icons.refresh),
          ),
        ),
      ],
    );
  }
}
