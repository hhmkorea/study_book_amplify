import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'amplifyconfiguration.dart'; // 1. amplify configure 설정한 구성 파일을 저장한 dart 파일

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  // 2. AmplifyAuthCognito를 플러그인 하고 amplify config 정보를 연동 
  void _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      print('Sucessfully configured');
    } on Exception catch (e) {
      print('Error configuring Amplify: $e');
    }
  }

  // 3. Amplify Authenticator UI라이브러리 빌드 시 연동, Authenticator 반환 
  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        // 4. builder: Authenticator.builder() 를 호출하면 Authenticator UI 라이브러리에서 구현된 로그인 화면 나타님 
        builder: Authenticator.builder(),
        home: const Scaffold(
          body: Center(
            child: Text('You are logged in!'),
          ),
        ),
      ),
    );
  }

}
