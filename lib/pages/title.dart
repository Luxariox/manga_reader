import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manga_reader/model/user_data.dart';
import 'package:provider/provider.dart';

class TitlePage extends StatelessWidget {
  final Drawer drawer;

  TitlePage({@required this.drawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manga Reader'),
      ),
      drawer: drawer,
      body: Consumer<UserData>(
        builder: (context, userData, child) {
          return ListView.builder(
            itemCount: userData.titles.length,
            itemBuilder: (context, i) {
              var keyList = userData.titles.keys.toList();
              var valueList = userData.titles.values.toList();

              return ListTile(
                title: Text(valueList[i]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    /// Remove a title from the base
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Supprimer'),
                          content: Text('Voulez-vous vraiment supprimer ce titre'),
                          actions: [
                            FlatButton(
                              child: Text('Annuler'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text('Supprimer'),
                              color: Colors.red,
                              onPressed: () {
                                userData.removeTitle(keyList[i]);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          /// Add a title to the base
          showDialog<int>(
            context: context,
            builder: (context) {
              int id;

              return AlertDialog(
                title: Text('Ajout'),
                content: TextField(
                  decoration: InputDecoration(
                    labelText: 'ID',
                  ),
                  onChanged: (text) {
                    id = int.parse(text);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]*')),
                  ],
                ),
                actions: [
                  FlatButton(
                    child: Text('Annuler'),
                    onPressed: () {
                      Navigator.pop(context, null);
                    },
                  ),
                  FlatButton(
                    child: Text('Valider'),
                    onPressed: () {
                      if (id != null && id != 0) {
                        Navigator.pop(context, id);
                      }
                    },
                  ),
                ],
              );
            },
          ).then((id) {
            if (id != null) {
              Provider.of<UserData>(context, listen: false).addTitle(id, '$id');
            }
          });
        },
      ),
    );
  }
}
