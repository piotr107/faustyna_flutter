import 'package:faustyna/models/menu_data_model.dart';
import 'package:faustyna/services/api_service.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController with StateMixin<MenuDataModel> {
  final RestApi api = Get.find();
  MenuDataModel? menuData;

  @override
  onInit() {
    _getMenuData();
    super.onInit();
  }

  _getMenuData() async {
    change(null, status: RxStatus.loading());
    menuData ??= await api.getMenuData();
    if (menuData == null) {
      change(null, status: RxStatus.error('Nie udało się pobrać menu'));
    } else {
      change(menuData, status: RxStatus.success());
    }
  }

  Future<void> refreshPage() async {
    change(null, status: RxStatus.loading());
    menuData = await api.getMenuData();
    if (menuData == null) {
      change(null, status: RxStatus.error('Nie udało się pobrać menu'));
    } else {
      change(menuData, status: RxStatus.success());
    }
  }
}