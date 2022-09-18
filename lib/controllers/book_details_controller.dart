import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/books_model.dart';

class BookDetailsController extends GetxController {
  final _storage = GetStorage();
  late final _favorite = false.obs;

  final Items _book = Get.arguments[0];
  final int _index = Get.arguments[1];

  bool get favorite => _favorite.value;
  Items get book => _book;
  int get index => _index;

  @override
  void onInit() {
    super.onInit();
    // _storage.erase();
    _favorite.value = _storage.hasData(_book.id.toString());
  }

  Future<void> openBookURL({required String url}) async {
    final Uri link = Uri.parse(url);

    if (!await launchUrl(link)) {
      throw 'Could not launch $link';
    }
  }

  void toogleFavorite() {
    _favorite.value = !_favorite.value;
    List favorites = _storage.read('favorites') ?? [];

    if (_favorite.value) {
      _storage.write(book.id!, book.id);
      favorites.add(_book.id!);
      _storage.remove('favorites');
      _storage.write('favorites', favorites);
      return;
    }

    favorites.removeWhere((element) => element == book.id);
    _storage.remove(book.id!);
    _storage.remove('favorites');
    _storage.write('favorites', favorites);
  }
}
