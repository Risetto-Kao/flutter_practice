import 'package:flutter/material.dart';
import 'package:flutter_practice/draggable/draggable_widget.dart';
import 'package:flutter_practice/model/poker_card.dart';

class DraggableApp extends StatelessWidget {
  const DraggableApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DragScreen(),
    );
  }
}

class DragScreen extends StatefulWidget {
  const DragScreen({Key? key}) : super(key: key);

  @override
  State<DragScreen> createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen> {
  bool isInside = false;
  PokerCard currentCard = PokerCard(pokerColor: '', point: 0);
  String acceptedData = "";

  List<PokerCard> cards = [
    PokerCard(pokerColor: '♠', point: 3),
    PokerCard(pokerColor: '♥️', point: 7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("draggable test"),
      // ),
      body: Stack(children: const <Widget>[
        DraggableWidget(
          offset: Offset(0, 0),
        ),
        // Positioned(
        //   child: DragTarget(
        //     builder: (context, accepted, reject) => Container(
        //       height: 100,
        //       width: 100,
        //       color: Colors.grey,
        //       child: Text(acceptedData),
        //     ),
        //     onAccept: (String data) {
        //       acceptedData = data;
        //     },
        //   ),
        //   top: 0,
        //   left: 0,
        // ),
      ]),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       DragTarget<PokerCard>(
      //         builder: (ctx, data, rejectedDate) {
      //           return Container(
      //             height: 200,
      //             width: 200,
      //             color: Colors.blue,
      //             child: Center(
      //               child: Text(
      //                 currentCard.point == 0
      //                     ? ''
      //                     : currentCard.pokerColor +
      //                         " " +
      //                         currentCard.point.toString(),
      //                 style: const TextStyle(fontSize: 50),
      //               ),
      //             ),
      //           );
      //         },
      //         onAccept: (data) => setState(() {
      //           isInside = true;
      //           currentCard = data;
      //         }),
      //         onWillAccept: (data) {
      //           return data!.point != 0;
      //         },
      //         onLeave: (data) {
      //           debugPrint(data.toString());
      //         },
      //         onMove: (details) {
      //           // debugPrint(details.offset.toString());
      //         },
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           PokerColorBox(
      //             card: cards[0],
      //             color: Colors.purple,
      //           ),
      //           PokerColorBox(
      //             card: cards[1],
      //             color: Colors.black54,
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

class PokerColorBox extends StatelessWidget {
  final PokerCard card;
  final Color color;

  const PokerColorBox({Key? key, required this.card, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      // return LongPressDraggable(
      onDragCompleted: () => debugPrint('complete'),
      data: card,
      child: Container(
        height: 100,
        width: 100,
        color: color,
        child: Center(
          child: Text(
            card.pokerColor + " " + card.point.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
      // ! feedback 是指他丟過去的東西
      feedback: Container(
        height: 100,
        width: 100,
        color: Colors.yellow,
        child: Center(
          child: Text(
            card.pokerColor,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
      childWhenDragging: Container(
        color: Colors.green,
      ),
      // childWhenDragging: Container(
      //   height: 100,
      //   width: 100,
      //   color: Colors.grey,
      // ),
    );
  }
}
