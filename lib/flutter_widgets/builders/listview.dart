import 'package:flutter/material.dart';

class ListGrid extends StatefulWidget {
  @override
  _ListGridState createState() => _ListGridState();
}

class _ListGridState extends State<ListGrid> {
  bool showGrid = false;

  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (index) => "Item $index");

    return Scaffold(
      appBar: AppBar(title: Text("List,Grid,FAB")),
      body: showGrid
          ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: items.length,
        itemBuilder: (context, index) => Card(
          color: Colors.blue.shade100,
          child: Center(child: Text(items[index])),
        ),
      )
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.star),
          title: Text(items[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showGrid = !showGrid;
          });
        },
        child: Icon(showGrid ? Icons.list : Icons.grid_view),
      ),
    );
  }
}
