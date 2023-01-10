import 'dart:io';

import 'package:all_file_reader/SDP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store_redirect/store_redirect.dart';

import 'all_files_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All Files Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  final _dialog = RatingDialog(
    // your app's name?
    title: const Text('Rate Us On App Store'),
    // encourage your user to leave a high rating?
    message: const Text('Select Number of Stars 1 to 5'),
    // your app's logo?
    image: const Image(
      image: Svg(
        "assets/appicon.svg",
      ),
    ),
    submitButtonText: 'Submit',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');
      // TODO: add your own logic
      if (response.rating < 3.0) {
        // send their comments to your email or anywhere you wish
        // ask the user to contact you instead of leaving a bad review
      } else {
        //go to app store
        StoreRedirect.redirect(
            androidAppId: 'com.example.all_file_reader',
            iOSAppId: 'com.example.allFileReader');
      }
    },
  );
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      body: Container(
        height: SDP.sdp(750),
        width: SDP.sdp(750),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/bg.png"),
          fit: BoxFit.fill,
        )),
        child: Stack(
          children: [
            Container(
              height: SDP.sdp(300),
              width: SDP.sdp(750),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(SDP.sdp(220), SDP.sdp(140)),
                ),
                color: const Color(0xFF528EF3),
              ),
            ),
            Positioned(
              top: SDP.sdp(20),
              child: Container(
                height: SDP.sdp(180),
                width: SDP.sdp(150),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: Svg(
                    "assets/homeicon.svg",
                  ),
                )),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: SDP.sdp(110), left: SDP.sdp(40)),
                  child: RichText(
                    text: TextSpan(
                      text: '\t All File\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SDP.sdp(14.0),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Reader',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SDP.sdp(20.0),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: SDP.sdp(180),
                left: SDP.sdp(30),
                child: RichText(
                  text: TextSpan(
                    text: 'All File\n',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SDP.sdp(26.0),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Reader',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SDP.sdp(38.0),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            Positioned(
                top: SDP.sdp(280),
                left: SDP.sdp(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllFiles()));
                  },
                  child: Container(
                    height: SDP.sdp(140),
                    width: SDP.sdp(130),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(SDP.sdp(20)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 4,
                          offset: Offset(4, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: SDP.sdp(40),
                          child: Image(
                            image: Svg("assets/fileicon.svg",
                                size: Size(SDP.sdp(50), SDP.sdp(50))),
                          ),
                        ),
                        SizedBox(
                          height: SDP.sdp(10),
                        ),
                        Text(
                          'All Files',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SDP.sdp(14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: SDP.sdp(280),
                left: SDP.sdp(160),
                child: Container(
                  height: SDP.sdp(140),
                  width: SDP.sdp(130),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SDP.sdp(20)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 4,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: SDP.sdp(40),
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          iconSize: SDP.sdp(60),
                          onPressed: () {
                            share();
                          },
                          icon: const Icon(Icons.share),
                          color: const Color(0xFFF2D648),
                        ),
                      ),
                      SizedBox(
                        height: SDP.sdp(10),
                      ),
                      Text(
                        'Share App',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: SDP.sdp(14.0),
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                top: SDP.sdp(440),
                left: SDP.sdp(10),
                child: Container(
                  height: SDP.sdp(140),
                  width: SDP.sdp(130),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SDP.sdp(20)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white10,
                        blurRadius: 4,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: SDP.sdp(40),
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          iconSize: SDP.sdp(60),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => _dialog,
                            );
                          },
                          icon: const Icon(Icons.star),
                          color: const Color(0xFFF2D648),
                        ),
                      ),
                      SizedBox(
                        height: SDP.sdp(10),
                      ),
                      Text(
                        'Rate Us',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: SDP.sdp(14.0),
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                top: SDP.sdp(440),
                left: SDP.sdp(160),
                child: GestureDetector(
                  onTap: () {
                    exit(0);
                  },
                  child: Container(
                    height: SDP.sdp(140),
                    width: SDP.sdp(130),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(SDP.sdp(20)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 4,
                          offset: Offset(4, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: SDP.sdp(40),
                          child: Image(
                            image: Svg("assets/exiticon.svg",
                                size: Size(SDP.sdp(50), SDP.sdp(50))),
                          ),
                        ),
                        SizedBox(
                          height: SDP.sdp(10),
                        ),
                        Text(
                          'Exit App',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SDP.sdp(14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
