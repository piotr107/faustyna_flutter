import 'package:faustyna/models/menu_data_model.dart';
import 'package:faustyna/models/news_model.dart';
import 'package:faustyna/services/api_service.dart';
import 'package:get/get.dart';

class NewsController extends GetxController with StateMixin<List<NewsModel>> {
  final RestApi api = Get.find();
  List<NewsModel>? newsData;

  @override
  onInit() {
    _getNewsData();
    super.onInit();
  }

  _getNewsData() async {
    change(null, status: RxStatus.loading());
    newsData ??= await api.getNews();
    if (newsData == null) {
      change(null, status: RxStatus.error('Nie udało się pobrać menu'));
    } else {
      change(newsData, status: RxStatus.success());
    }
  }

  Future<void> refreshPage() async {
    change(null, status: RxStatus.loading());
    newsData = await api.getNews();
    if (newsData == null) {
      change(null, status: RxStatus.error('Nie udało się pobrać menu'));
    } else {
      change(newsData, status: RxStatus.success());
    }
  }
}