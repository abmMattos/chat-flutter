import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/components/custom_input.dart';
import 'package:flutter_application_3/services/firestorage_service.dart';
import 'package:intl/intl.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController messageController = TextEditingController();

  var feedbacks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    feedbacks = FirestorageService().getFeedbacks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Feedbacks')),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            feedbacks = FirestorageService().getFeedbacks();
          });
        },
        child: FutureBuilder(
          future: feedbacks,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Timestamp date = snapshot.data[index]['date'];
                    var formatDate = DateFormat('dd/MM').format(date.toDate());
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text(snapshot.data[index]['user'].toString()),
                      subtitle: Text(snapshot.data[index]['message'].toString()),
                      trailing: Text(formatDate),
                    );
                  });
            }
          },
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                keyboardType: TextInputType.multiline,
                controller: messageController,
                maxLines: 4,
                decoration: InputDecoration(border: OutlineInputBorder())),
          )),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
                onPressed: () async {
                  await FirestorageService()
                      .postFeedback(messageController.text);
                },
                child: Icon(Icons.send)),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(onPressed: () {}, child: Icon(Icons.mic)),
          ),
        ],
      ),
    );
  }
}