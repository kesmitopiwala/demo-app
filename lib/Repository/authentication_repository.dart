import 'package:hypnosis/Data/API/api_manager.dart';
import 'package:hypnosis/Models/login_success_response_model.dart';

class AuthenticationRepository {
  final ApiManager apiHelper;

  AuthenticationRepository(this.apiHelper);

  /// Change According your need
  Future<LoginSuccessResponseModel> loginApiCall(Map parameters) async {
    var json = await apiHelper.post("users/login", parameters,
        objcontentType: jsonContentType, isErrorSnackShow: true);
    var response = LoginSuccessResponseModel.fromJson(json);
    return response;
  }
}
