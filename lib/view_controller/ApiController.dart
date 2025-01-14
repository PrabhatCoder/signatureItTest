import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../http_helper.dart';
import '../models/CategoryListReponse.dart';
import '../models/DetailsReponse.dart';
import '../networks/NetwworManager.dart';
import '../snack_bar/SnackBar_view.dart';

class ApiController extends GetxController {
  var list = <Responsee>[].obs;
  var listDetails = <DetailsData>[].obs;
  var item = Responsee().obs;
  var itemDetails = DetailsData().obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    hitCategory();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> onItemClick(int index) async {
    item.value = list[index];

    var data ={"CategoryId":"${item.value.rootCategoryId}"};
    HttpHelper.post(
        "api/M2mg/GetProductDetailsCategoryWise",data
    ).then(
          (value) {
            DetailsReponse itemResponse = DetailsReponse.fromJson(value);

        if ((itemResponse.status ?? false) == true) {


          listDetails.value = itemResponse.response!;
          itemDetails.value=listDetails[0];
          // itemDetails.value=listDetails.where((p0) {
          //   return p0.productId==(item.value.rootCategoryId??0);
          // },).singleOrNull!;
        } else {
          SnackBarView.errorSnackBar(title: itemResponse.message ?? "");
        }
      },
    );

  }

  Future<void> hitProductDetails() async {


  }

  Future<void> hitCategory() async {
    final isConnected = await NetworkManager.instance.isConnected();

    if (!isConnected) {
      //  PFullScreenLoader.stopLoading();
      return;
    }

    HttpHelper.get(
      "api/M2mg/CategoryList",
    ).then(
      (value) {
        CategoryResponse itemResponse = CategoryResponse.fromJson(value);

        if ((itemResponse.status ?? false) == true) {
          list.value = itemResponse.response!;
        } else {
          SnackBarView.errorSnackBar(title: itemResponse.message ?? "");
        }
      },
    );
  }
}
