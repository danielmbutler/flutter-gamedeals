class Constants {
  static const String API_KEY = '8e2e9531e7b440868d3dbee765a1176c';
  static const String TOP_HEADLINES_URL = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY';

  static String headlinesFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY';
  }

  static const Map<String, String> Countries = {
    "United States of America" : "us",
    "India" : "in",
    "Korea" : "kr",
    "China" : "ch",
  };
}