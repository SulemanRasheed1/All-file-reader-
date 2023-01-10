import 'dart:io' as io;
import 'dart:io';

import 'package:all_file_reader/SDP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'CustomSearchDelegate.dart';
import 'fileview.dart';

class FileListView extends StatefulWidget {
  FileListView({this.filetype, this.fileicon, this.title});
  String filetype;
  String fileicon;
  String title;
  @override
  State<FileListView> createState() =>
      _FileListViewState(filetype: filetype, fileicon: fileicon, title: title);
}

class _FileListViewState extends State<FileListView> {
  _FileListViewState({this.filetype, this.fileicon, this.title});
  String filetype;
  String fileicon;
  String title;
  List subFile = [];
  final List _searchfiles = [];
  final List _folders = [];
  List<File> file = [];
  Directory _dic;
  final String _path = "/sdcard/";
  @override
  void initState() {
    FileFinder(_path);
  }

  void FileFinder(String _subPath) {
    _dic = Directory(_subPath);
    try {
      if (_dic.existsSync()) {
        subFile = io.Directory(_subPath).listSync();
        subFile.forEach((element) {
          if (element.toString().contains('File')) {
            if (element.toString().contains(filetype)) {
              file.add(element);
              element =
                  element.toString().split(': ').last.replaceAll('\'', '');
              element = element.toString().split('/').last;
              _searchfiles.add(element.toString());
            }
          } else {
            _folders.add(element.toString());
            element = element.toString().split(': ').last.replaceAll('\'', '');
            FileFinder(element.toString());
          }
        });
        setState(() {});
      } else {
        _dic.createSync(recursive: true);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0.0001),
        elevation: 0,
        title: Text(
          title,
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
      body: Stack(
        children: [
          Container(
            width: SDP.sdp(270),
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: SDP.sdp(115)),
              child: GridView.builder(
                itemCount: _searchfiles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 4),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        SDP.sdp(25), SDP.sdp(0), SDP.sdp(5), SDP.sdp(10)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FileView(
                                      filename: _searchfiles[index].toString(),
                                      filepath: file[index],
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(SDP.sdp(10))),
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Wrap(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: SDP.sdp(10),
                                ),
                                Image(
                                  image: Svg("assets/$fileicon.svg",
                                      size: Size(SDP.sdp(50), SDP.sdp(50))),
                                ),
                                SizedBox(
                                  height: SDP.sdp(10),
                                ),
                                FittedBox(
                                  child: Padding(
                                    padding: EdgeInsets.all(SDP.sdp(8)),
                                    child: Text(
                                      _searchfiles[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: SDP.sdp(14.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: SDP.sdp(170),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(SDP.sdp(20)),
                  bottomRight: Radius.circular(SDP.sdp(20))),
              color: const Color(0xFF528EF3),
            ),
          ),
          Positioned(
            top: SDP.sdp(100),
            right: SDP.sdp(25),
            child: ClipRect(
                //clipBehavior: Clip.none,
                child: Container(
              height: SDP.sdp(40),
              width: SDP.sdp(260),
              decoration: BoxDecoration(
                color: const Color(0xFF5F95EF),
                borderRadius: BorderRadius.all(Radius.circular(SDP.sdp(40))),
              ),
              child: InkWell(
                child: TextField(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(
                          searchTerms: _searchfiles,
                          fileicon: fileicon,
                          file: file),
                    );
                  },
                  decoration: InputDecoration(
                    suffixIcon: Align(
                      widthFactor: SDP.sdp(1),
                      heightFactor: SDP.sdp(1),
                      child: const Icon(
                        Icons.search,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    hintText: ' Search',
                    hintStyle: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontSize: SDP.sdp(SDP.sdp(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius:
                          BorderRadius.all(Radius.circular(SDP.sdp(40))),
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
