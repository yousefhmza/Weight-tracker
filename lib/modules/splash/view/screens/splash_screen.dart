import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:weight_tracker/core/utils/globals.dart';
import 'package:weight_tracker/modules/auth/models/user_model.dart';
import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final StreamSubscription<User?> authStateStreamSubscription;

  @override
  void initState() {
    super.initState();
    Future.delayed(Time.t2000, () async {
      authStateStreamSubscription = FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user == null) {
          NavigationService.pushReplacementAll(context, Routes.authScreen);
        } else {
          // Usually I make an API request to get current user from the save token locally but in this demo we
          // only have the id of the user so this is not needed
          currentUser = UserModel(id: user.uid);
          NavigationService.pushReplacementAll(context, Routes.homeScreen);
        }
      });
    });
  }

  @override
  void dispose() {
    authStateStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const StatusBar(
      child: Scaffold(
        body: Center(child: WTrackerLogo()),
      ),
    );
  }
}
