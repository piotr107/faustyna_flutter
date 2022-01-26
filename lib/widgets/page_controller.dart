import 'package:faustyna/services/api_service.dart';
import 'package:get/get.dart';

class ArticlePageController extends GetxController with StateMixin<String> {
  final RestApi api = Get.find();
  String? content;
  final String pageId;

  ArticlePageController({
    required this.pageId
  });

  @override
  onInit() {
    _getPageData();
    super.onInit();
  }

  _getPageData() async {
    change(null, status: RxStatus.loading());
    content ??= await api.getPage(pageId);
    if (content == null) {
      change(null, status: RxStatus.error('Nie udało się pobrać strony'));
    } else {
      change(content, status: RxStatus.success());
    }
  }
}