class ArticleModel {
  String name;
  String images;
  String gender;
  String species;
  String homePlanet;
  String occupation;
  String sayings;
  String? age;

  ArticleModel(
      {required this.name,
      required this.images,
      required this.gender,
      required this.species,
      required this.homePlanet,
      required this.occupation,
      required this.sayings,
      required this.age});
}
