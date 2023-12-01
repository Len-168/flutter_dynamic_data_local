class DataWatch{
  late String imageProfile, imageCover, title, about;
  late double times;
  late int years;

  DataWatch(String imageProfile, String imageCover, String title, String about, int years, double times){
    this.imageProfile = imageProfile;
    this.imageCover = imageCover;
    this.title = title;
    this.about  = about;
    this.years = years;
    this.times = times;
  }
}

List<DataWatch> dataWatchList = [
  DataWatch("images/movie1.png", "images/movie2.png", "title", "about", 2023, 129),
  DataWatch("images/movie3.png", "images/movie4.png", "Spider-Man", "about", 2018, 58),
  DataWatch("images/movie5.png", "images/movie6.png", "title", "about", 2020, 60),
  DataWatch("images/movie3.png", "images/movie4.png", "Spider-Man", "about", 2019, 67),
  DataWatch("images/movie1.png", "images/movie2.png", "title", "about", 2021, 143),
  DataWatch("images/movie3.png", "images/movie4.png", "Spider-Man", "about", 2018, 72),
  DataWatch("images/movie5.png", "images/movie6.png", "title", "about", 2017, 65),
  DataWatch("images/movie3.png", "images/movie4.png", "Spider-Man", "about", 2022, 54)
];