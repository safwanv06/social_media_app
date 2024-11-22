class HomeController{
  static int calculateDays({required DateTime date}){
    Duration difference = DateTime.now().difference(date);
    return difference.inDays;
  }
}