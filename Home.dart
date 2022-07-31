// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'call_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<MovieModel> main_movies_list = [
    MovieModel(
      'The Godfather',
      1972,
      'https://cdn.britannica.com/55/188355-050-D5E49258/Salvatore-Corsitto-The-Godfather-Marlon-Brando-Francis.jpg',
      9.2,
    ),
    MovieModel(
      'Stranger Things',
      2016,
      'https://img.estadao.com.br/fotos/crop/1200x900/resources/jpg/4/6/1645119257464.jpg',
      8.7,
    ),
    MovieModel(
      'Prison Break',
      2005,
      'https://www.pontozero.net.br/wp-content/uploads/2017/03/Prison-Break-Slide-.png',
      8.3,
    ),
    MovieModel(
      'Breaking Bad',
      2008,
      'https://onlineseries.com.br/wp-content/uploads/2021/02/Breaking-Bad-Walter-White.jpg',
      9.5,
    ),
    MovieModel(
      'Dark',
      2017,
      'https://observatoriodocinema.uol.com.br/wp-content/uploads/2020/06/dark_netflix-19014324.jpg',
      8.7,
    ),
    MovieModel(
      'Big Mouth',
      2017,
      'https://observatoriodocinema.uol.com.br/wp-content/uploads/2021/11/big-mouth-5.jpg',
      7.9,
    ),
    MovieModel(
      'Rick And Morty',
      2013,
      'https://ahoradoplay.com/wp-content/uploads/2019/07/rick-and-morty-cena-s04-1280x720.jpg',
      9.2,
    ),
    MovieModel(
      'The Godfather',
      1972,
      'https://cdn.britannica.com/55/188355-050-D5E49258/Salvatore-Corsitto-The-Godfather-Marlon-Brando-Francis.jpg',
      9.2,
    ),
    MovieModel(
      'The Boys',
      2019,
      'https://m.media-amazon.com/images/M/MV5BOTEyNDJhMDAtY2U5ZS00OTMzLTkwODktMjU3MjFkZWVlMGYyXkEyXkFqcGdeQXVyMjkwOTAyMDU@._V1_UY67_CR4,0,45,67_AL_.jpg',
      8.7,
    ),
    MovieModel(
      'Black Panther',
      2022,
      'https://www.pontozero.net.br/wp-content/uploads/2017/03/Prison-Break-Slide-.png',
      8.4,
    ),
    MovieModel(
      'Black Bird',
      2022,
      'https://m.media-amazon.com/images/M/MV5BZjI3NjcyN2UtMGNhZC00YTYxLWJmOTQtNWI1ZGJmNjA4ZjY5XkEyXkFqcGdeQXVyNjEwNTM2Mzc@._V1_UX45_CR0,0,45,67_AL_.jpg',
      8.3,
    ),
    MovieModel(
      'Game of thrones',
      2011,
      'https://m.media-amazon.com/images/M/MV5BYTRiNDQwYzAtMzVlZS00NTI5LWJjYjUtMzkwNTUzMWMxZTllXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_UY67_CR2,0,45,67_AL_.jpg',
      9.2,
    ),
    MovieModel(
      'Dumb And Dumber',
      1994,
      'https://occ.a.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABU1SviWfWPgxmdLfrvhREfwRLcDR8P1cNisb3dgdlU95Iar2UZx65QNySXVl2N9jEfUZexkT_QdOuvq0MDEKIDdpwr8krTvUUlmJ.jpg?r=3f6',
      7.4,
    ),
    MovieModel(
      'Two a half and a men',
      2003,
      'https://observatoriodocinema.uol.com.br/wp-content/uploads/2019/04/Two-and-a-Half-Men.jpg',
      7.1,
    ),
  ];

  List<MovieModel> display_list = List.from(main_movies_list);

  void updateList(String value) {
    setState(() {
      display_list = main_movies_list
          .where((element) =>
              element.movie_name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 227, 227),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 70, bottom: 25),
            child: TextField(
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Movies',
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Expanded(
            child: display_list.length == 0
                ? Center(
                    child: Text(
                    'No Results Found :(',
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ))
                : ListView.builder(
                    itemCount: display_list.length,
                    itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.only(left: 30, right: 30),
                          title: Text(
                            display_list[index].movie_name!,
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          subtitle: Text(
                            '${display_list[index].movie_year}',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          trailing: Text(
                            '${display_list[index]..movie_rating}',
                            style: TextStyle(
                                color: Color.fromARGB(255, 128, 123, 23)),
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              '${display_list[index].movie_poster}',
                              width: 75,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
          ),
        ],
      ),
    );
  }
}
