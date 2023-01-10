import 'dart:io';

import 'package:all_file_reader/SDP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'fileview.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({this.searchTerms, this.fileicon, this.file});
  List searchTerms = [];
  String fileicon;
  List<File> file = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: Colors.blue),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.blue),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];
    for (var language in searchTerms) {
      if (language.toString().contains(query.toLowerCase())) {
        matchQuery.add(language);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var results = matchQuery[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(SDP.sdp(10))),
            color: Colors.white,
          ),
          child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FileView(
                              filename: searchTerms[index].toString(),
                              filepath: file[index],
                            )));
              },
              leading: Image(
                image: Svg("assets/$fileicon.svg",
                    size: Size(SDP.sdp(100), SDP.sdp(150))),
              ),
              title: Text(
                results,
              )),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];
    for (var language in searchTerms) {
      if (language.toString().contains(query.toLowerCase())) {
        matchQuery.add(language);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var results = matchQuery[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
              SDP.sdp(5), SDP.sdp(0), SDP.sdp(5), SDP.sdp(10)),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FileView(
                                filename: searchTerms[index].toString(),
                                filepath: file[index],
                              )));
                },
                leading: Image(
                  image: Svg("assets/$fileicon.svg",
                      size: Size(SDP.sdp(100), SDP.sdp(150))),
                ),
                title: Text(results)),
          ),
        );
      },
    );
  }
}
