import 'package:get/get.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/data/recipe.dart';

class Recipes extends GetxController {
  final List<Recipe> _recipes = [
    Recipe(),
    Recipe(
      image: "assets/recipe_image/nasigoreng.jpg",
      title: "Nasi Goreng Spesial",
      price: "\$",
      time: "44m",
      ingredients: "500 gr nasi\n"
          "3 sdm minyak sayur\n"
          "150 gr daging ayam goreng suwir\n"
          "3 sdm kecap manis\n"
          "2 butir telur ayam\n"
          "1 sdm kaldu bubuk non MSG\n"
          "1/2 sdt merica bubuk\n\n"
          "Haluskan:\n"
          "5 butir bawang merah\n"
          "3 siung bawang putih\n"
          "3 buah cabe merah\n"
          "2 sdt terasi goreng\n"
          "2 sdt garam\n\n"
          "Pelengkap:\n"
          "Keurupuk kanji\n"
          "Acar mentimun\n",
      steps: "1. Panaskan minyak, tumis bumbu halus hingga wangi.\n"
          "2. Kocok telur hingga rata. Tuangkan ke dalam bumbu. Aduk rata.\n"
          "3. Masukkan nasi, ayam suwir, kaldu bubuk, kecap manis dan merica.\n"
          "4. Aduk-aduk hingga seluruhnya tercampur rata dan agak kering.\n"
          "5. Angkat dan sajikan dengan Pelengkapnya.\n",
    ),
    Recipe(
      image: "assets/recipe_image/spaghettibolognese.jpg",
      title: "Spaghetti Bolognese Uenak",
      price: "\$\$\$",
      time: "49m",
      ingredients: "250 g spaghetti kering\n"
          "2.5 liter air\n"
          "Saus Bolognese:\n"
          "3 sdm mentega\n"
          "50 g bawang bombay, cincang halus\n"
          "3 siung bawang putih, cincang kasar\n"
          "100 g jamur kancing, cincang\n"
          "300 g daging sapi cincang\n"
          "2 sdm tomat pasta\n"
          "3 buah tomat merah, parut\n"
          "1 sdt organo kering\n"
          "2 sdt basil kering\n"
          "2 lembar bayleaf\n"
          "1/2 sdt merica hitam, memarkan\n"
          "1 sdt gula pasir\n"
          "2 sdt garam\n"
          "250 ml air rebusan pasta\n"
          "Taburan:\n"
          "50 g keju parmesan, serut tipis\n"
          "10 lembar daun basil segar\n",
      steps:
          "1. Didihkan air dalam panci, rebus spaghetti hingga lunak 'al dente'. Tiriskan dan sisihkan air perebusnya 250 ml.\n"
          "2. Saus Bolognese: Lelehkan mentega dalam wajan, tumis bawang bombay dan bawang putih. Aduk hingga layu dan wangi.\n"
          "3. Masukkan jamur dan aduk-aduk hingga layu kecokelatan.\n"
          "4. Tambahkan daging sapi, aduk hingga kecokelatan dan matang.\n"
          "5. Masukkan tomat pasta, tomat halus, organo, basil, bayleaf, merica, gula asir dan garam.\n"
          "6. Tuangi air rebusan pasta dan tambahkan spaghetti, aduk-aduk hingga agak kering.\n"
          "7. Angkat, sajikan hangat dengan keju Parmesan dan daun basil segar.\n"
          "8. Sajikan hangat.\n",
    ),
    Recipe(
      image: "assets/recipe_image/bakso.jpg",
      title: "Bakso",
      price: "\$\$",
      time: "50m",
      ingredients: "Tepung Sagu/Kanji 50 gram\n"
          "Daging Sapi 350 gram\n"
          "Bawang Putih 4 siung\n"
          "Merica 1/2 sdt.\n"
          "Air Es 100 cc\n"
          "Garam 3 sdt.\n"
          "Telur 1 butir\n"
          "Bahan Kuah:\n"
          "Daun Bawang 2 batang (diiris)\n"
          "Bawang Putih 6 siung\n"
          "Garam 3 sdt.\n"
          "Air 2 liter\n"
          "Merica 1/2 sdt.\n"
          "Tulang/Lutut Sapi 600 gram\n"
          "Untuk membuat kuah bakso sapi, pertama-tama haluskan bawang putih dengan garam dan merica. Setelah itu didihkan air dengan bumbu tersebut, lalu masukkan tulang. Masak hingga mendidih, lalu saring kuahnya.\n",
      steps:
          "1. Pertama-tama, haluskan bawang putih bersama dengan garam dan merica.\n"
          "2. Giling daging sapi hingga halus, lalu campurkan dengan tepung sagu, bumbu halus, air es, serta telur. Aduk dan campurkan hingga rata.\n"
          "3. Panaskan air hingga mendidih. Apabila sudah mendidih, matikan apinya.\n"
          "4. Ambil adonan bakso sesuai selera, lalu bentuk bulat-bulat menggunakan tangan.\n"
          "5. Masukkan bakso secara perlahan ke air. Lakukan hingga adonan habis.\n"
          "6. Nyalakan kembali api dan masak hingga bakso mengapung. Itu tandanya bakso sudah matang. Angkat dan tiriskan.\n"
          "7. Untuk penyajiannya, siapkan mangkuk, tata mie kuning basah dan bakso, lalu tuang dengan kuah. Tambahkan bahan pelengkap seperti bawang goreng dan daun bawang.\n"
          "8. Bakso sapi super lezat siap dihidangkan!\n",
    ),
    Recipe(
      image: "assets/recipe_image/sate.jpg",
      title: "Sate",
      price: "\$\$",
      time: "50m",
      ingredients: "Bahan:\n"
          "- 500 gram daging ayam dengan atau tanpa lemak, potong dadu\n"
          "- 20 tusuk sate\n"
          "\n"
          "Bumbu:\n"
          "- 250 gram kacang tanah\n"
          "- 10 siung bawang putih\n"
          "- 4 butir kemiri\n"
          "- 6 sendok makan bawang goreng\n"
          "- gula merah secukupnya\n"
          "- kecap manis secukupnya\n"
          "- garam secukupnya\n"
          "- minyak goreng secukupnya\n"
          "\n"
          "Pelengkap:\n"
          "- bawang merah secukupnya, iris halus\n"
          "- jeruk nipis secukupnya\n"
          "- cabai rawit secukupnya, rebus dan haluskan\n",
      steps:
          "1. Goreng kacang tanah bersama bawang putih dan kemiri hingga matang, kemudian tiriskan minyaknya.\n"
          "2. Haluskan kacang tanah, gula merah, bawang putih, dan kemiri dengan cara diuleg. Masukkan bawang goreng, kemudian uleg kembali hingga benar-benar halus.\n"
          "3. Tuangi bumbu kacang dengan air panas mendidih secukupnya dan kecap manis. Aduk rata.\n"
          "4. Urap sate dengan sedikit bumbu kacang yang sudah dibuat, kemudian bakar di atas bara api arang hingga matang.\n"
          "5. Sajikan sate ayam bersama bumbu kacang, bawang merah iris, dan cabai rawit yang sudah dihaluskan.\n",
    ),
  ].obs;

  List<Recipe> get recipes {
    return [..._recipes];
  }

  List<Recipe> get bookmarkedRecipes {
    return _recipes.where((item) => item.bookmarked.value).toList();
  }

  bool checkBookmarked(int id) {
    final int index = _recipes.indexWhere((recipe) => recipe.id == id);
    return _recipes[index].bookmarked.value;
  }

  void bookmark(int id) {
    final int index = _recipes.indexWhere((recipe) => recipe.id == id);
    _recipes[index].bookmarked.value = !_recipes[index].bookmarked.value;
  }
}
