import 'package:get/get.dart';

class Recipe {
  String image;
  String title;
  String price;
  String time;
  String ingredients;
  String steps;
  RxBool bookmarked = false.obs;
  String docName;

  Recipe({
    this.image = "assets/recipe_image/rendang.jpg",
    this.title = "Rendang",
    this.price = "\$\$",
    this.time = "3j",
    this.ingredients = "1 kg daging sapi\n"
        "3 butir kelapa, diambil santan kental dan santan encernya\n"
        "4 lembar daun jeruk\n"
        "3 batang serai, memarkan\n"
        "4 butir asam kandis\n"
        "100 ml minyak goreng\n"
        "5 gram garam\n"
        "Bumbu rendang daging sapi 1 Kg\n"
        "60 gram bawang merah\n"
        "50 gram bawang putih\n"
        "250 gram cabai merah besar\n"
        "100 gram lengkuas\n"
        "50 gram kemiri\n"
        "2 gram cengkeh\n",
    this.steps = "1. Haluskan semua bahan Bumbu dengan diulek atau diblender.\n"
        "2. Tumis bumbu dengan sedikit minyak goreng hingga wangi.\n"
        "3. Masukkan batang serai, daun jeruk, asam kandis dan garam, aduk rata.\n"
        "4. Tuangi santan dan dididihkan, masukkan daging.\n"
        "5. Masak dengan api kecil selama beberapa jam sampai daging empuk dan bumbu kecokelatan sesuai selera.\n",
    this.docName = "",
    bool bookmarked = false,
  }) {
    if (bookmarked) {
      this.bookmarked.value = true;
    }
  }
}
