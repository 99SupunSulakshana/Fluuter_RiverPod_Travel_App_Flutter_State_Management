class Trip {
  final String title;
  final List<String> photoes;
  final String description;
  final DateTime date;
  final String location;

  Trip(
      {required this.title,
      required this.photoes,
      required this.description,
      required this.date,
      required this.location});
}
