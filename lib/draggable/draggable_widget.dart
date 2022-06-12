import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final Offset offset;

  const DraggableWidget({Key? key, required this.offset}) : super(key: key);

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  late Offset _offset;

  @override
  void initState() {
    super.initState();
    _offset = Offset(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    double statusHeight = MediaQuery.of(context).viewPadding.top;

    return Positioned(
      top: _offset.dy,
      left: _offset.dx,
      child: Draggable(
        feedback: Container(
          width: 100,
          height: 100,
          color: Colors.blue.withOpacity(0.3),
        ),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
        data: "Encrypted Data",
        onDragEnd: (details) {
          setState(() {
            _offset = details.offset;
            debugPrint(_offset.dx.toString() + ";" + _offset.dy.toString());
          });
        },
        // onDraggableCanceled: (v, o) {
        //   _offset = o;
        //   debugPrint(_offset.dx.toString() + ";" + _offset.dy.toString());
        // },
      ),
    );
  }
}
