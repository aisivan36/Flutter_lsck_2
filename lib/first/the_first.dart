import 'package:flutter/material.dart';

class TheFirst extends StatelessWidget {
  const TheFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var star = Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Icon(
    //       Icons.star,
    //       color: Colors.green[500],
    //     ),
    //     Icon(
    //       Icons.star,
    //       color: Colors.green[500],
    //     ),
    //     Icon(
    //       Icons.star,
    //       color: Colors.green[500],
    //     ),
    //     const Icon(
    //       Icons.star,
    //       color: Colors.black,
    //     ),
    //     const Icon(
    //       Icons.star,
    //       color: Colors.black,
    //     )
    //   ],
    // );

    // final ratings = Container(
    //   padding: const EdgeInsets.all(20),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       starts,
    //       const Text(
    //         "170 Reviews",
    //         style: TextStyle(
    //           color: Colors.black,
    //           fontFamily: 'Roboto',
    //           letterSpacing: 0.5,
    //           fontSize: 20,
    //         ),
    //       )
    //     ],
    //   ),
    // );

    // const descTextStyle = TextStyle(
    //   color: Colors.black,
    //   fontWeight: FontWeight.w800,
    //   fontFamily: 'Roboto',
    //   letterSpacing: 0.5,
    //   fontSize: 18,
    //   height: 2,
    // );

    // final iconList = DefaultTextStyle(
    //     style: descTextStyle,
    //     child: Container(
    //       padding: const EdgeInsets.all(20),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Column(
    //             children: [
    //               Icon(Icons.kitchen, color: Colors.green[500]),
    //               const Text('PREP:'),
    //               const Text('25 min'),
    //             ],
    //           ),
    //           Column(
    //             children: [
    //               Icon(
    //                 Icons.timer,
    //                 color: Colors.green[500],
    //               ),
    //               const Text('COOk:'),
    //               const Text('1 hr'),
    //             ],
    //           ),
    //           Column(
    //             children: [
    //               Icon(
    //                 Icons.restaurant,
    //                 color: Colors.green[500],
    //               ),
    //               const Text('FEEDS:'),
    //               const Text('4-6'),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ));

    // final leftColumn = Container(
    //   padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
    //   child: Column(
    //     children: [
    //       titleText,
    //       subTitle,
    //       ratings,
    //       iconList,
    //     ],
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter layout demo"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                SizedBox(
                  width: 440,
                  child: _buildList(),
                ),
                // mainImage,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView(
      children: [
        _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
        _tile('The Castro Theater', '429 Castro St', Icons.theaters),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        _tile('Roxie Theater', '3117 16th St', Icons.theaters),
        _tile('United Artists Stonestown Twin', '501 Buckingham Way',
            Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        const Divider(),
        _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
        _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
        _tile('Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
        _tile('La Ciccia', '291 30th St', Icons.restaurant),
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }

  // Widget _buildImageColumn() {
  //   return Container(
  //     decoration: const BoxDecoration(color: Colors.black26),
  //     child: Column(
  //       children: [
  //         _buildImageColumn(1),
  //         _buildImageColumn(3),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildDecoratedImage(int imageIndex) => Expanded(
  //         child: Container(
  //       decoration: BoxDecoration(
  //           border: Border.all(width: 10, color: Colors.black38),
  //           borderRadius: const BorderRadius.all(Radius.circular(8))),
  //       margin: const EdgeInsets.all(4),
  //       child: Image.asset('images/pic$imageIndex.png'),
  //     ));

  // Widget _buildImageRow(int imageIndex) => Row(
  //       children: [
  //         _buildDecoratedImage(imageIndex),
  //         _buildDecoratedImage(imageIndex + 1)
  //       ],
  //     );

  // ignore: unused_element
  Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(6),
      );

  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (index) => Container(
            child: Image.asset('images/pic$index.png'),
          ));
}
