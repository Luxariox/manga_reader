import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manga_reader/model/data/chapter_detailled_data.dart';

class ChapterReader extends StatefulWidget {
  final ChapterDetailedData chapter;

  ChapterReader({@required this.chapter});

  @override
  _ChapterReaderState createState() => _ChapterReaderState();
}

class _ChapterReaderState extends State<ChapterReader> {
  List<Uint8List> imagesData;

  @override
  void initState() {
    imagesData = [];

    _loadImages();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chapter.getTitle()),
      ),
      body: ListView.builder(
        itemCount: widget.chapter.pages.length,
        itemBuilder: (context, i) {
          if (i < imagesData.length) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Image.memory(imagesData[i]),
            );
          } else {
            return Container(
              height: 300.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  void _loadImages() async {
    for (var page in widget.chapter.pages) {
      var url = '${widget.chapter.server}/${widget.chapter.hash}/$page';
      var imageData = await NetworkAssetBundle(Uri.parse(url)).load("");
      setState(() {
        imagesData.add(imageData.buffer.asUint8List());
      });
    }
  }
}
