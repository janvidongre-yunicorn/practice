import 'dart:async';
import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  @override
  _StreamBuilderPageState createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  late Stream<int> numberStream;

  @override
  void initState() {
    super.initState();
    numberStream = Stream.periodic(Duration(seconds: 1), (count) => count)
        .take(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StreamBuilder")),
      body: Center(
        child: StreamBuilder<int>(
          stream: numberStream,
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text("====Waiting for data..."),
                ],
              );
            }

            // ========= Error state
            if (snapshot.hasError) {
              return Text("/////////// Error: ${snapshot.error}");
            }

            // =====Done state (stream completed)
            if (snapshot.connectionState == ConnectionState.done) {
              return Text("*************Stream Finished", style: TextStyle(fontSize: 22));
            }

            // ===========Active state (data received)
            if (snapshot.hasData) {
              return Text(
                "+++++++++++ Current Value: ${snapshot.data}",
                style: TextStyle(fontSize: 24),
              );
            }

            // =================Default (no data)
            return Text("No Data Available");
          },
        ),
      ),
    );
  }
}

