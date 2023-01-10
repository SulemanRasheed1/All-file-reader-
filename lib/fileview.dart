import 'dart:io';

import 'package:all_file_reader/SDP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_filereader/flutter_filereader.dart';

class FileView extends StatefulWidget {
  FileView({this.filename, this.filepath});
  String filename;
  File filepath;

  @override
  _FileViewState createState() =>
      _FileViewState(filename: filename, filepath: filepath);
}

class _FileViewState extends State<FileView> {
  _FileViewState({this.filename, this.filepath});
  String filename;
  File filepath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0.0001),
        elevation: 0,
        title: FittedBox(
          child: Text(
            filename,
            style: TextStyle(
              color: const Color(0xFFFFFFFF),
              fontSize: SDP.sdp(18.0),
            ),
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
          children: [
            Container(
              height: SDP.sdp(80),
              width: SDP.sdp(750),
              decoration: BoxDecoration(
                color: const Color(0xFF528EF3),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(SDP.sdp(20)),
                    bottomRight: Radius.circular(SDP.sdp(20))),
              ),
            ),
            SizedBox(
              height: SDP.sdp(20),
            ),
            SizedBox(
              height: SDP.sdp(400),
              child: FileReaderView(
                filePath: filepath.path,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
