import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/data/auth/models/signup_req_params.dart';
import 'package:flutter_movie_app/data/auth/sources/auth_api_service.dart';
import 'package:flutter_movie_app/domain/auth/repositories/auth.dart';

 class AuthRepositoryImpl extends AuthRepository {
   AuthApiService authApiService;

   AuthRepositoryImpl({required this.authApiService});

  @override
  Future<Either> signup(SignUpReqParams params) async {
    return await  authApiService.signUp(params);
  }
}
