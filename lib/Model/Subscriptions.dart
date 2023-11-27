class Subscriptions{
  final int id;
  final String title,image;
  Subscriptions({required this.id, required this.title, required this.image});
}
List<Subscriptions>subscriptions=[
  Subscriptions(id: 1, title: 'Easy Stories in English', image: 'assets/sub1.png'),
  Subscriptions(id: 2, title: 'The Debrief', image: 'assets/sub2.png'),
  Subscriptions(id: 3, title: 'World Business Report', image: 'assets/sub3.png'),
];