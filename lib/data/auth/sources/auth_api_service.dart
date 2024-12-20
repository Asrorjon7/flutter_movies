import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_app/core/constants/api_url.dart';
import 'package:flutter_movie_app/core/network/dio_client.dart';
import 'package:flutter_movie_app/data/auth/models/signup_req_params.dart';
import '../../../service_locator.dart';

abstract class AuthApiService {
  Future<Either> signUp(SignUpReqParams params);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signUp(SignUpReqParams params) async {
    try {
      var response = await sl<DioClient>().post(ApiUrl.signup, data: params.toMap());

      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
