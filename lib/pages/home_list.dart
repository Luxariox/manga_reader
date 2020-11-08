import 'package:flutter/material.dart';
import 'package:manga_reader/model/chapter_list/data.dart';
import 'package:manga_reader/model/language_filter.dart';
import 'package:manga_reader/model/mangadex_api.dart';
import 'package:manga_reader/model/sorter.dart';
import 'package:manga_reader/widget/chapter_item.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  Future<List<ChapterData>> chapterList;

  @override
  void initState() {
    chapterList = _fetchChapterList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manga Reader'),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: () {
            setState(() {
              chapterList = _fetchChapterList();
            });
          }),
        ],
      ),
      drawer: Drawer(),
      body: FutureBuilder(
        future: chapterList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }

          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            var unfilteredData = snapshot.data as List<ChapterData>;
            var data = LanguageFilter.chapterData(unfilteredData, ['gb', 'fr']);
            Sorter.chapterDataTimestamp(data);

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    i != 0 ? Divider() : Container(),
                    _needMangaTitle(data, i) ?
                    Column(
                      children: [
                        ListTile(
                          title: Text(
                            data[i].mangaTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    ) :
                    Container(),
                    ChapterItem(chapterData: data[i]),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  bool _needMangaTitle(List<ChapterData> data, int i) {
    return i == 0 || data[i - 1].mangaId != data[i].mangaId;
  }

  Future<List<ChapterData>> _fetchChapterList() {
    return MangadexApi.getChaptersList([21063, 17274]);
  }
}
