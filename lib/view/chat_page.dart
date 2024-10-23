import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/messages_data.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(),
        ),
        title: Text(chat["receiver"]),
      ),
      body: ListView.builder(
        itemCount: chat["messages"].length,
        itemBuilder: (context, index) {
          return Align(
            alignment: (chat["messages"][index]["sender"] == "André")
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(chat["messages"][index]["message"]),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        chat["messages"][index]["created_at"],
                        style: TextStyle(fontSize: 9, color: Colors.black87),
                      ),
                      ( chat["messages"][index]["sender"] == "André" ) ?
                      Icon(
                        Icons.check,
                        size: 16,
                        color: (chat["messages"][index]["readed"]) ? Colors.blue : Colors.black45
                      ): SizedBox()
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
