import 'package:flutter/material.dart';
import 'package:flutter_application_3/services/get.users.dart';
import 'package:flutter_application_3/view/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(100, 158, 158, 158),
        appBar: AppBar(
          title: Text('Home Page'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  12,
                  (index) {
                    return Container(
                        margin: EdgeInsets.all(8),
                        child: CircleAvatar(radius: 45));
                  },
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: getUsers(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.85),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  user: snapshot.data[index])));
                          getUsers();
                        },
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(snapshot.data[index]['image']),
                                radius: 60,
                              ),
                              Text(
                                snapshot.data[index]['firstName'],
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(snapshot.data[index]['company']['title'])
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ))
          ],
        )
      );
  }
}

// GridView.builder(
//               itemCount: users.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 0.85),
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigator.push(context,
//                     //     MaterialPageRoute(builder: (context) => DetailPage(user: users[index])));
//                     getUsers();
//                   },
//                   child: Container(
//                     color: Colors.white,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: NetworkImage(users[index]['image']),
//                           radius: 60,
//                         ),
//                         Text(
//                           users[index]['firstName'],
//                           style: TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.bold),
//                         ),
//                         Text(users[index]['company']['title'])
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )
