import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/common/helper/navigation/app_navigator.dart';
import 'package:flutter_movie_app/core/configs/assets/app_images.dart';
import 'package:flutter_movie_app/presentation/auth/pages/signin.dart';
import 'package:flutter_movie_app/presentation/home/pages/home.dart';
import 'package:flutter_movie_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:flutter_movie_app/presentation/splash/bloc/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
       if (state is UnAuthenticated) {
         AppNavigator.pushReplacement(context, SignInPage());
       }
       if (state is Authenticated) {
         AppNavigator.pushReplacement(context, HomePages());
       }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppImages.splashBackground))),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.center, end: Alignment.bottomCenter, colors: [Color(0xFF1A1B20).withOpacity(0), Color(0xFF1A1B20)]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
