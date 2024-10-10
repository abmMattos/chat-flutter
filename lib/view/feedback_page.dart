import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/components/custom_input.dart';
import 'package:flutter_application_3/services/firestorage_service.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Feedbacks')),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 24, 
        itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(),
          title: Text('Andre'),
          subtitle: Text('Lorem,Lorem,Lorem,Lorem,LoremLorem,Lorem,Lorem,Lorem'),
          trailing: Text('10/10'),
        );
      }),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                )
              ),
            )
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              onPressed: () async {
                await FirestorageService().postFeedback();
              }, 
              child: Icon(Icons.send)
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              onPressed: () {}, 
              child: Icon(Icons.mic)
            ),
          ),
        ],
      ),
    );
  }
}