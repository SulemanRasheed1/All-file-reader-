import 'package:all_file_reader/SDP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'files.dart';

class AllFiles extends StatefulWidget {
  @override
  _AllFilesState createState() => _AllFilesState();
}

class _AllFilesState extends State<AllFiles> {
  void initState() {
    Permission.storage.request();
    Permission.manageExternalStorage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0.0001),
        elevation: 0,
        title: Text(
          'All File Reader',
          style: TextStyle(
            color: const Color(0xFFFFFFFF),
            fontSize: SDP.sdp(18.0),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: const Color(0xFFFFFFFF),
        ),
      ),
      body: Container(
        height: SDP.sdp(750),
        width: SDP.sdp(750),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/bg.png"),
          fit: BoxFit.fill,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: SDP.sdp(190),
              width: SDP.sdp(500),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SDP.sdp(45)),
                  topRight: Radius.circular(SDP.sdp(45)),
                  bottomRight: Radius.circular(SDP.sdp(45)),
                  bottomLeft: Radius.circular(SDP.sdp(45)),
                ),
                color: const Color(0xFF528EF3),
              ),
            ),
            SizedBox(
              height: SDP.sdp(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FileListView(
                                  fileicon: 'docicon',
                                  filetype: '.docx',
                                  title: 'Doc Files',
                                )));
                  },
                  child: Container(
                    height: SDP.sdp(120),
                    width: SDP.sdp(110),
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
                        Image(
                          image: Svg("assets/docicon.svg",
                              size: Size(SDP.sdp(50), SDP.sdp(50))),
                        ),
                        SizedBox(
                          height: SDP.sdp(10),
                        ),
                        Text(
                          'Doc Files',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SDP.sdp(14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FileListView(
                                  fileicon: 'xlsicon',
                                  filetype: '.xlsx',
                                  title: 'XLS Files',
                                )));
                  },
                  child: Container(
                    height: SDP.sdp(120),
                    width: SDP.sdp(110),
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
                        Image(
                          image: Svg("assets/xlsicon.svg",
                              size: Size(SDP.sdp(50), SDP.sdp(50))),
                        ),
                        SizedBox(
                          height: SDP.sdp(10),
                        ),
                        Text(
                          'XLS Files',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SDP.sdp(14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SDP.sdp(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FileListView(
                                  fileicon: 'pptxicon',
                                  filetype: '.pptx',
                                  title: 'PPT Files',
                                )));
                  },
                  child: Container(
                    height: SDP.sdp(120),
                    width: SDP.sdp(110),
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
                        Image(
                          image: Svg("assets/pptxicon.svg",
                              size: Size(SDP.sdp(50), SDP.sdp(50))),
                        ),
                        SizedBox(
                          height: SDP.sdp(10),
                        ),
                        Text(
                          'PPT Files',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SDP.sdp(14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FileListView(
                                  fileicon: 'pdficon',
                                  filetype: '.pdf',
                                  title: 'PDF Files',
                                )));
                  },
                  child: Container(
                    height: SDP.sdp(120),
                    width: SDP.sdp(110),
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
                        Image(
                          image: Svg("assets/pdficon.svg",
                              size: Size(SDP.sdp(50), SDP.sdp(50))),
                        ),
                        SizedBox(
                          height: SDP.sdp(10),
                        ),
                        Text(
                          'PDF Files',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: SDP.sdp(14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
