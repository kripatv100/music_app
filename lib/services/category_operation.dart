import 'package:music_app/models/category.dart';

class CategoryOperation {
  CategoryOperation._() {}
  static List<Category> getCategories() {
    return <Category>[
      Category("Top Hits",
          "https://cdns-images.dzcdn.net/images/cover/3b41fe8a0093479daa4aa5037274c28c/0x1900-000000-80-0-0.jpg"),
      Category("Malayalam Hits",
          "https://s.saregama.tech/image/c/fw_485/7/6b/55/evergreen-collections-memorable-malayalam-hits_1527008471.jpg"),
      Category("Tamil hits",
          "https://musicboxspot.com/images/category_img/1718612151.png"),
      Category("Bollywood Hits",
          "https://yt3.googleusercontent.com/4EbTq1Ai-Xo045AkABt0u0gJRupC0UArbTu5DLsBUkldp_EZYdXNPwVoivN4sOZTjcMyC2oLyqE=s900-c-k-c0x00ffffff-no-rj")
    ];
  }
}
