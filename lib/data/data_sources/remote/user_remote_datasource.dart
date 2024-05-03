import 'package:dio/dio.dart';
import 'package:tehno_mir/core/constants/strings/endpoints.dart';
import 'package:tehno_mir/core/error/error_handler.dart';
import 'package:tehno_mir/data/models/user_model/user_model.dart';
import 'package:tehno_mir/domain/entities/user.dart';
import '../../../core/local/token_store.dart';
import '../../../core/network/api_provider.dart';
import '../../../domain/usecases/user/sign_in_usecase.dart';
import '../../../domain/usecases/user/sign_up_usecase.dart';
import '../../models/user_model/authentication_response_model.dart';

abstract class UserRemoteDataSource{
  Future<UserEntity> signIn(SignInParams params);
  Future<UserEntity> signUp(SignUpParams params);
  Future<void> signOut(String refreshToken);
  Future<UserEntity> getUser();

}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiProvider apiProvider;
  UserRemoteDataSourceImpl(this.apiProvider);

  @override
  Future<UserEntity> signUp(SignUpParams params)async {

    var formData = FormData.fromMap({
      'full_name':params.userName,
      'phone_number':params.phoneNumber,
      'password':params.password,
      'password2':params.confirmPassword,
    });

      final response = await apiProvider.post(endPoint: ApiEndpoints.register,
      data: formData, isMultiPart: true);

      print('------------${response.statusCode}---------------');

      if (response.statusCode == 201) {
        final accessToken = response.data['access_token'];
        final refreshToken = response.data['refresh_token'];
        final message =response.data['message'];
        print(response.data['message']+'\n SUCCESSFUL');

        // Store tokens
        await Store.setToken(accessToken);
        await Store.setRefreshToken(refreshToken);
        var a = await Store.getToken();
        var b = await Store.getRefreshToken();
        print('------------token added--------------');
        print(a);
        print('--------------------------');
        print('-----------refresh token added---------------');
        print(b);
        print('--------------------------');

        var userData = await getUser();
        return userData;

      }
      else{
        print(response.toString()+'datasource -- datasource not 200 ');
        var a = await Store.getToken();
        print('????????????????????????');
        print(a);
        print('????????????????????????');
        throw ErrorHandler.handle(response.data['message']);
      }
  }

  @override
  Future<void> signOut(String refreshToken)async {
    final response = await apiProvider.post(endPoint: ApiEndpoints.signOut,
    data: {'refresh_token':refreshToken});
    if (response.statusCode == 200) {
      print(response.data);
    }
    else{
      print('------------Error in  logout---------');
      print(response.data);
    }

  }

  @override
  Future<UserEntity> getUser() async{
   final response = await apiProvider.get(endPoint: ApiEndpoints.userData);
   if (response.statusCode == 200) {
     return UserModel.fromJson(response.data);
   }

   else{
    throw 'statusCode${response.statusCode}';
   }
  }
  @override
  Future<UserEntity> signIn(SignInParams params) async {
    var formData = FormData.fromMap({
      'phone_number':params.phoneNumber,
      'password':params.password,
    });

    try{
      final response = await apiProvider.post(
        endPoint: ApiEndpoints.signIn,
        data: formData,
        isMultiPart: true,
      );
      if (response.statusCode == 200) {
        final accessToken = response.data['access'];
        final refreshToken = response.data['refresh'];
        // Store tokens
        await Store.setToken(accessToken);
        await Store.setRefreshToken(refreshToken);
        // var a = await Store.getToken();
        // var b = await Store.getRefreshToken();
        var userData = await getUser();
          return userData;



      }
      else{

        throw ErrorHandler.handle(response.data['message']);
      }

    }catch(e){
      print('Exception caught: $e');
      rethrow;
    }
  }
}

