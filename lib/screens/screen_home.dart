import 'package:flutter/material.dart';
import 'package:music_app/models/category.dart';
import 'package:music_app/models/music.dart';
import 'package:music_app/services/category_operation.dart';
import 'package:music_app/services/music_operation.dart';

class ScreenHome extends StatelessWidget {
  Function _miniPlayer;

  ScreenHome(this._miniPlayer, {super.key});

  Widget createCategory(Category category) {
    return Container(
      color: Colors.blueGrey.shade300,
      child: Row(
        children: [
          Image.network(
            category.imageUrl,
            fit: BoxFit.cover,
            width: 66,
            height: 66,
          ),
          Text(
            category.name,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  List<Widget> createListofCategories() {
    List<Category> categoryList = CategoryOperation.getCategories();
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 200,
              width: 200,
              child: InkWell(
                  onTap: () {
                    _miniPlayer(music, stop: true);
                  },
                  child: Image.network(music.image, fit: BoxFit.cover))),
          Text(music.name, style: TextStyle(color: Colors.white)),
          Text(music.desc, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperation.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
        padding: const EdgeInsets.all(8.0),
        height: 200,
        child: GridView.count(
          childAspectRatio: 5 / 2,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: createListofCategories(),
        ));
  }

  Widget createAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text('Good Morning'),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
      actions: const [
        Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blueGrey.shade100,
            Colors.black38,
            Colors.black45,
            Colors.black45,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            createAppBar(),
            SizedBox(
              height: 5,
            ),
            createGrid(),
            createMusicList('Made for you'),
            createMusicList('Popular Playlist')
          ],
        ),
      ),
    );
  }
}
