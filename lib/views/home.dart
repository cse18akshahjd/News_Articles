import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_articles/helper/news.dart';
import 'package:news_articles/model/articles_model.dart';
import 'package:news_articles/views/article_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticleModel> articles = [];
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNewsArticle();
    articles = news.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LIST OF NEWS ARTICLES",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: articles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ArticleSelector(
                              name: articles[index].name,
                              imageURL: articles[index].images,
                              gender: articles[index].gender,
                              species: articles[index].species,
                              homePlanet: articles[index].homePlanet,
                              occupation: articles[index].occupation,
                              saying: articles[index].sayings,
                              say: articles[index].sayings,
                            );
                          })
                    ],
                  ))),
    );
  }
}


class ArticleSelector extends StatelessWidget {
  final String imageURL, name, gender, species, homePlanet, occupation, saying, say;
  ArticleSelector(
      {this.imageURL = "noImage",
      this.name = "noName",
      this.gender = "noGender",
      this.species = "noSpecies",
      this.homePlanet = "noHomePlanet",
      this.occupation = "noOccupation",
      this.saying = "No Article Present",
      required this.say});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 200,
        width: 400,
        child: Stack(
          children: [
            Positioned(
                top: 10,
                child: Material(
                  child: Container(
                    height: 180.0,
                    width: 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                )),
            Positioned(
                child: Card(
              elevation: 10.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(imageURL),
                  ),
                ),
              ),
            )),
            Positioned(
                top: 45,
                left: 160,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Name: " + name,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text("Gender: " + gender,
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      Text("Species: " + species,
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      Text("Home Planet: " + homePlanet,
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      Text("Occupation: " + occupation,
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context) => new ArticleView(say: say))
                            );
                          },
                          child: Text(
                            "Read Article",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                ))
          ],
        ),
      )
    ]);
  }
}
