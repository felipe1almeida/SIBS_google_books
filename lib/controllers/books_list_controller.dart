import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/books_model.dart';
import '../repositories/books_repository.dart';

class BooksListController extends GetxController with ScrollMixin {
  final BooksRepository _booksRepository;
  final _storage = GetStorage();

  late final Worker workerPage;
  final _tooglePage = false.obs;
  final _hasError = false.obs;
  final _loading = false.obs;
  final _page = 0.obs;
  final _max = 12.obs;
  final _hasFavorites = false.obs;

  final Rx<BooksModel> _booksList = BooksModel().obs;
  final _books = [].obs;

  BooksListController({required BooksRepository booksRepository}) : _booksRepository = booksRepository;

  BooksModel get booksList => _booksList.value;
  bool get tooglePage => _tooglePage.value;
  bool get isLoading => _loading.value;
  bool get hasError => _hasError.value;
  List get books => _books;
  bool get hasFavorite => _hasFavorites.value;

  @override
  void onInit() {
    workerPage = ever<int>(_page, (_) => _loadMoreBooks());
    _hasFavorites.value = _storage.hasData('favorites');
    super.onInit();
  }

  @override
  void onReady() {
    _showBooksList();
    super.onReady();
  }

  @override
  void onClose() {
    workerPage();
    super.onClose();
  }

  Future<BooksModel> _getBookList() async => await _booksRepository.getBooksList(page: _page.value, max: _max.value);

  Future<void> _showBooksList() async {
    _loading(true);
    try {
      final response = await _getBookList();

      _books.clear();
      _books.addAll(response.items as List<Items>);
    } on Exception {
      _books.clear();
      _hasError(true);
    }
    _loading(false);
  }

  Future<void> _loadMoreBooks() async {
    _loading(true);
    try {
      _booksList.value = await _getBookList();
      _books.addAll(_booksList.value.items as List<Items>);
    } on Exception {
      _books.clear();
      _hasError(true);
    }
    _loading(false);
  }

  Future<void> _getFavoriteList() async {
    _loading(true);
    _hasError(false);
    List favorites = _storage.read('favorites') ?? [];

    _books.clear();
    for (var bookId in favorites) {
      try {
        final response = await _booksRepository.getVolume(volumeId: bookId);
        _books.add(response);
      } on Exception {
        _books.clear();
        _hasError(true);
      }
    }
    _loading(false);
  }

  void toogleFavoriteBtn() {
    _tooglePage.value = !_tooglePage.value;
    if (_tooglePage.value) {
      _getFavoriteList();
      return;
    }
    _page.value = 0;
    _showBooksList();
  }

  void retryRequest() {
    if (_tooglePage.value) {
      _hasError(false);
      _getFavoriteList();
      return;
    }
    _showBooksList();
    _hasError(false);
  }

  @override
  Future<void> onEndScroll() async {
    if (!_loading.value && !_tooglePage.value) {
      _page.value += 12;
    }
  }

  @override
  Future<void> onTopScroll() async {}
}
