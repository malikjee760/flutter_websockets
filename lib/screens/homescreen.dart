import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket extends StatefulWidget {
  final WebSocketChannel channel =
      WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org'));
  @override
  _WebSocketState createState() => _WebSocketState();
}

class _WebSocketState extends State<WebSocket> {
  final inputController = TextEditingController();
  List<String> messageList = [];
  @override
  Widget build(BuildContext context) {
    var channel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Socket Tutorial'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: InputDecoration(
                      labelText: 'Send Message',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Send'),
                    onPressed: () {
                      if (inputController.text.isNotEmpty) {
                        print(inputController.text);
                        widget.channel.sink.add(inputController.text);

                        inputController.text = '';
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            )
        ],
      ),
    );
  }

  ListView getMessageList() {
    // ignore: non_constant_identifier_names
    List<Widget> listWidget = [];

    for (String message in messageList) {
      listWidget.add(ListTile(
        title: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              message,
              style: TextStyle(fontSize: 22),
            ),
          ),
          color: Colors.teal[50],
          height: 60,
        ),
      ));
    }
    return ListView(
      children: listWidget,
    );
  }
  //  @override
  // void dispose() {
  //   inputController.dispose();
  //   widget.channel.sink.close();
  //   super.dispose();
  // }
}
