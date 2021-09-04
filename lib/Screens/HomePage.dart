import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_application/Core/Proivder/MovieProvider.dart';
import 'package:movie_application/Screens/MovieDetailScreen.dart';
import 'package:movie_application/Utilities/CustomTextField.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController yearController = TextEditingController();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: Text("Movies Application"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CustomTextField(
                  controller: titleController,
                  hintText: "Title",
                ),
                SizedBox(
                  width: 10,
                ),
                CustomTextField(
                  controller: yearController,
                  hintText: "Year",
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Provider.of<MovieProvider>(context, listen: false)
                          .getMovieData(
                              titleController.text, yearController.text);
                    }),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<MovieProvider>(
                builder: (context, movieProvider, movieList) {
              if (movieProvider.movieState == MovieStates.Loading)
                return Text("");
              else if (movieProvider.movieState == MovieStates.Success) {
                if (movieProvider.moviesList.Search.length == 0)
                  return Text("No Matched Results");
                else
                  return Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: movieProvider.moviesList.Search.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/moviedetail',
                                arguments:
                                    "${movieProvider.moviesList.Search[index].Title.toString()}",
                              );
                            },
                            child: ListTile(
                              leading: Container(
                                width: 40,
                                height: 90,
                                child: movieProvider
                                            .moviesList.Search[index].Poster
                                            .toString() ==
                                        "N/A"
                                    ? Text(
                                        "No Image ",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    : Image.network(
                                        "${movieProvider.moviesList.Search[index].Poster}",
                                      ),
                              ),
                              title: Text(
                                  "${movieProvider.moviesList.Search[index].Title}"),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Divider(),
                          );
                        }),
                  );
              } else
                return Center(
                  child: Text("${movieProvider.errorMsg}"),
                );
            })
          ],
        ));
  }
}
