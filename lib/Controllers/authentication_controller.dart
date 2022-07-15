import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hypnosis/Models/login_success_response_model.dart';
import 'package:hypnosis/Utils/constant.dart';

class AuthenticationController extends GetxController {
  // final authenticationRepository = AuthenticationRepository();

  final currentUserData = UserData().obs;

  ///
  /// This method used for set the current login user to the app
  ///
  setCurrentUser() {
    printInfo(info: GetStorage().read(AppPreferencesHelper.pUser).toString());
    currentUserData.value =
        UserData.fromJson(GetStorage().read(AppPreferencesHelper.pUser));
  }
}
