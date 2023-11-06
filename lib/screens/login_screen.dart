import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teama_work_app_new/config/constant.dart';
import 'package:teama_work_app_new/provider/member_provider.dart';
import 'package:teama_work_app_new/repositories/member_repository.dart';
import 'package:teama_work_app_new/screens/home_screen.dart';
import 'package:teama_work_app_new/styles/color_style.dart';
import 'package:teama_work_app_new/widgets/alert_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _autoLogin = false; // 자동 로그인
  bool _isLoading = false; // 로그인 로딩

  // 초기화
  final _idController = TextEditingController();
  final _pwController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  // 로그인 실패 이벤트
  void _handleLoginFailure(dynamic error) {
    print('로그인 실패: $error');
  }

// 로그인 시 띄울 에러 메시지 창
  void _showLoginErrorDialog(String errMsg) {
    showDialog(
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.2),
      context: context,
      builder: (BuildContext context) => CustomAlertDialog(errMsg: errMsg),
    );
  }

  // 로그인 성공 이벤트
  void _handleLoginResult(Map<String, dynamic> memberInfo) async {
    bool canLogin = memberInfo['login'];

    if (canLogin) {
      MemberProvider memberProvider =
          Provider.of<MemberProvider>(context, listen: false);
      memberProvider.setMemberInfo(memberInfo['memModel'].member);
      // prefs에 저장
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // 유저 정보 저장
      String jsonString = jsonEncode(memberInfo['memModel'].member.toJson());

      await prefs.setString('isMemberInfo', jsonString);
      await prefs.setBool('autoLogin', _autoLogin); // 자동 로그인 flag 저장

      int loginTimestampMillis =
          DateTime.now().millisecondsSinceEpoch; // 로그인 타임스탬프 저장
      await prefs.setInt('loginTimestamp', loginTimestampMillis);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(index: 0),
        ),
      );
    } else {
      String errMsg = memberInfo['err_msg'];
      _showLoginErrorDialog(errMsg);
    }
  }

  Future<void> setLogin() async {
    // final String memId = _idController.text;
    // final String memPw = _pwController.text;
    String memId = 'robin';
    String memPw = '321654';

    // if (memId.isEmpty) {
    //   _showLoginErrorDialog('아이디를 입력해주세요.');
    //   return;
    // }

    // if (memPw.isEmpty) {
    //   _showLoginErrorDialog('비밀번호를 입력해주세요.');
    //   return;
    // }

    try {
      // 로그인 정보 가져오기
      final memberInfo = await MemberRepository.getMemberInfo(memId, memPw);
      setState(() {
        _isLoading = true; // Show CircularProgressIndicator
      });

      final canLogin = memberInfo['login'];
      final errMsg = memberInfo['err_msg'] ?? '';

      if (canLogin) {
        _handleLoginResult(memberInfo);
      } else {
        _showLoginErrorDialog(errMsg);
      }
    } catch (e) {
      _handleLoginFailure(e);
    } finally {
      setState(() {
        _isLoading = false; // CircularProgressIndicator flase
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : LayoutBuilder(builder: (context, constraints) {
              final fontSSize =
                  constraints.maxWidth > LayoutStyles.maxWidth ? 13.0 : 12.0;
              final fontMSize =
                  constraints.maxWidth > LayoutStyles.maxWidth ? 18.0 : 16.0;
              final fontLSize =
                  constraints.maxWidth > LayoutStyles.maxWidth ? 28.0 : 26.0;
              return Padding(
                padding: const EdgeInsets.fromLTRB(30, 110, 30, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/logo_black_sm.png",
                      width: 40,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '반가워요 :)\nERP SYSTEM입니다.',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 20, 11, 11),
                        fontSize: fontLSize,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _idController,
                      decoration: const InputDecoration(
                        hintText: '아이디',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _pwController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        hintText: '비밀번호',
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FractionallySizedBox(
                      widthFactor: 1.0,
                      child: ElevatedButton(
                        onPressed: () {
                          setLogin();
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 55),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorStyles.basicColor),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                        child: Text(
                          '로 그 인',
                          style: TextStyle(
                            fontSize: fontMSize,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _autoLogin,
                          onChanged: (value) {
                            // _saveAutoLoginState(value!);
                          },
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _autoLogin = !_autoLogin;
                                // _saveAutoLoginState(_autoLogin);
                              });
                            },
                            child: const Text(
                              '자동 로그인',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 221, 221, 221),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '• 팀에이컴퍼니 직원 외 접근을 금합니다.',
                              style: TextStyle(
                                color: ColorStyles.memoColor,
                                fontSize: fontSSize,
                              ),
                            ),
                            Text(
                              '• 비밀번호 분실시 총무팀에 문의하세요.',
                              style: TextStyle(
                                color: ColorStyles.memoColor,
                                fontSize: fontSSize,
                              ),
                            ),
                            Text(
                              '• 기능 오류시 개발팀에 문의하세요.',
                              style: TextStyle(
                                color: ColorStyles.memoColor,
                                fontSize: fontSSize,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
    ));
  }
}
