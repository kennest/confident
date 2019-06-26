import 'package:confident/models/user.dart';
import 'package:confident/pages/pages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 180.0, 10.0, 0.0),
              height: 650.0,
              width: double.infinity,
              color: Color.fromARGB(30, 3, 69, 101),
              child: ListView(
                  itemExtent: 70.0,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
                  children: ListTile.divideTiles(
                    //          <-- ListTile.divideTiles
                    context: context,
                    tiles: [
                      chatItem("+225 08 01 00 05",
                          "Ceci est un message fictif...", 1),
                      chatItem("+225 09 00 08 40",
                          "Ceci est un message fictif...", 2),
                      chatItem("+225 08 10 00 00",
                          "Ceci est un message fictif...", 2),
                      chatItem("+225 08 00 10 00",
                          "Ceci est un message fictif...", 1),
                      chatItem("+225 08 50 00 02",
                          "Ceci est un message fictif...", 4),
                      chatItem("+225 09 50 00 08",
                          "Ceci est un message fictif...", 1),
                      chatItem("+225 08 07 00 07",
                          "Ceci est un message fictif...", 5),
                      chatItem("+225 08 08 00 07",
                          "Ceci est un message fictif...", 3),
                      chatItem("+225 08 08 00 10",
                          "Ceci est un message fictif...", 3),
                      chatItem("+225 08 40 00 30",
                          "Ceci est un message fictif...", 1),
                      chatItem("+225 08 20 00 80",
                          "Ceci est un message fictif...", 4),
                      chatItem("+225 08 60 00 50",
                          "Ceci est un message fictif...", 1),
                      chatItem("+225 08 20 05 40",
                          "Ceci est un message fictif...", 5),
                    ],
                  ).toList()),
            ),
            Container(
              width: double.infinity,
              height: 100.0,
              child: AppBar(
                title: Text('Conversation'),
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
                ],
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.blue.withOpacity(0.5), BlendMode.srcATop),
                      image: AssetImage('assets/images/home_header_bg.png'),fit: BoxFit.cover)),
            ),
            Positioned(
              top: 70.0,
              left: 35.0,
              child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8.0),
                          border: new Border.all(color: Colors.white)),
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.chat_bubble,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            "Chats",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                  SizedBox(
                    width: 40.0,
                  ),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.blue,
                          border: new Border.all(color: Colors.white)),
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            "Stories",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                  SizedBox(
                    width: 40.0,
                  ),
                  InkWell(
                    splashColor: Colors.white,
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.blue,
                            border: new Border.all(color: Colors.white)),
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              "Calls",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    onTap: (){},
                  )
                ],
              ),
            )
          ],
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.chat),
      onPressed: (){},
    ),);
  }

  Widget chatItem(String peerId, String subtitle, int num) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.asset('assets/images/user_item_$num.png'),
      ),
      title: Text(
        peerId,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('$subtitle      08:50'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatRoomPage(peerId:peerId ,peerAvatar: "assets/images/logo.png",),
          ),
        );
      },
    );
  }
}
