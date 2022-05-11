class NewsModel {
  String title;
  String sub;
  String image;

  NewsModel({required this.title, required this.sub, required this.image});
}

List<NewsModel> newsModel = [
  NewsModel(
      title: 'NDE Disburses',
      sub:
          'NDE Disburses N9.3m Loan To 93 Farmers In \n Bauchi To Boost Crops, Animals Production.',
      image: 'assets/farmer1.jpg'),
  NewsModel(
      title: 'Enforce Law',
      sub:
          'Enforce Anti-Grazing Law, Else Food Scarcity\n‘Ll Persist, Farmers Tell Lawmakers',
      image: 'assets/Farmer2.png'),
  NewsModel(
      title: 'Lawmakers',
      sub: 'Ondo Lawmaker Empowers Farmers With 200\n Motorcycles, Inputs',
      image: 'assets/farmer3.jpg'),
  NewsModel(
      title: 'Exchange',
      sub: 'AfDB To Establish Onion Commodity Exchange \nIn Sokoto —Tambuwal',
      image: 'assets/farmer4.jpg'),
  NewsModel(
      title: 'Fish Prod',
      sub: 'How Nigeria Can Maximise Fish Production \n For Export —FUTA Don',
      image: 'assets/farmer5.jpg'),
];
