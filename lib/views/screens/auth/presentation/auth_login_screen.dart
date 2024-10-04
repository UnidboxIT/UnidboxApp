import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pushy_flutter/pushy_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';
import 'package:unidbox_app/views/screens/auth/presentation/widgets/each_text_field_widget.dart';
import 'package:unidbox_app/views/screens/auth/presentation/widgets/login_image_widget.dart';
import 'package:unidbox_app/views/screens/auth/presentation/widgets/remember_me_widget.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import '../../../../main.dart';
import '../../../../utils/constant/app_color.dart';
import '../../../widgets/button/button_widget.dart';
import '../../../widgets/text_widget.dart';
import '../../internet_connection/provider/internet_provider.dart';
import '../../internet_connection/state/connection_status.dart';
import '../../notification_service/pushy_noti_service.dart';
import '../repository/auth_state_notifier.dart';
import '../repository/state/auth_state.dart';

class AuthLoginScreen extends ConsumerStatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthLoginScreenState();
}

class _AuthLoginScreenState extends ConsumerState<AuthLoginScreen> {
  TextEditingController txtUserID = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtDomain = TextEditingController();
  bool paymentState = false;
  bool isVisiblity = false;
  bool isCheck = false;
  bool dialogShown = false;

  @override
  void initState() {
    super.initState();
    Pushy.listen();
    final state = ref.read(sharedPreferencesProvider);
    setState(() {
      txtUserID.text = state.getString(AppKeys.userName) ?? "";
      txtPassword.text = state.getString(AppKeys.password) ?? "";
      isCheck = state.getBool("isRemember") ?? false;
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (!dialogShown) {
    //     dialogShown = true; // Mark as shown
    //     Future.delayed(const Duration(milliseconds: 10), () async {
    //       addDomainDialog().then((_) {
    //         ref
    //             .read(authStateNotifierControllerProvider.notifier)
    //             .retrieveDomainName();
    //       });
    //     });
    //   }
    // });
    superPrint(isCheck);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((tp) async {
      pushyToken = await Pushy.register();
      superPrint("HERE 1 >>>> $pushyToken");
      if (ref.watch(connectivityStatusProviders) ==
          ConnectivityStatus.isConnected) {
        pushyRegister(backgroundNotificationListener);
      }
    });

    ref.watch(authStateNotifierControllerProvider);
    ref.listen(authStateNotifierControllerProvider, (prev, next) {
      if (next is Loading) {
        setState(() {
          paymentState = true;
        });
      }
      if (next is Error) {
        setState(() {
          paymentState = false;
        });
      }
      if (next is Success) {
        setState(() {
          ref
              .watch(authStateNotifierControllerProvider.notifier)
              .checkUserAuthorization();
          paymentState = false;
        });
      }
    });

    return SuperScaffold(
      topColor: Colors.white,
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PopScope(
          canPop: false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: loginImageWidget()),
                SizedBox(height: 7.h),
                textWidget("Employee ID", fontWeight: FontWeight.bold),
                const SizedBox(height: 10),
                eachTextFieldWidget(txtUserID, "Employee ID"),
                SizedBox(height: 3.h),
                textWidget("Password", fontWeight: FontWeight.bold),
                const SizedBox(height: 10),
                eachPasswordWidget(txtPassword, "Password", isVisiblity, () {
                  FocusManager.instance.primaryFocus!.unfocus();
                  setState(() {
                    isVisiblity = !isVisiblity;
                  });
                }),
                const SizedBox(height: 20),
                rememberMeWidget(ref, isCheck, () {
                  setState(() {
                    isCheck = !isCheck;
                  });
                  superPrint(isCheck);
                  Future.delayed(const Duration(milliseconds: 10), () {
                    ref
                        .read(authStateNotifierControllerProvider.notifier)
                        .rememberMe(txtUserID.text, txtPassword.text, isCheck);
                  });
                }),
                SizedBox(height: 5.h),
                Center(
                  child: Container(
                    width: 40.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 7,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus!.unfocus();
                        ref
                            .read(authStateNotifierControllerProvider.notifier)
                            .signIn(
                              txtUserID.text.trim(),
                              txtPassword.text.trim(),
                              ref,
                              context,
                              isCheck,
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        surfaceTintColor: Colors.white,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: paymentState
                          ? Center(
                              child: CupertinoActivityIndicator(
                                color: AppColor.primary,
                              ),
                            )
                          : textWidget(
                              "Login",
                              fontWeight: FontWeight.bold,
                            ),
                    ),
                  ),
                )
                // loginButtonWidget(txtUserID, txtPassword, context, ref),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addDomainDialog() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.white,
            child: SizedBox(
              height: 25.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: TextField(
                          textAlign: TextAlign.left,
                          controller: txtDomain,
                          cursorColor: Colors.grey,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "http://128.199.107.219:8073/",
                            hintStyle: TextStyle(
                                fontSize: 13,
                                color: AppColor.fontColor.withOpacity(0.4),
                                fontWeight: FontWeight.w500),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            suffix: const SizedBox(width: 25),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 50.w,
                    child: buttonWidget("Next", () {
                      if (txtDomain.text.isEmpty) {
                        txtDomain.text = "http://128.199.107.219:8073/";
                      }
                      ref
                          .read(authStateNotifierControllerProvider.notifier)
                          .saveDomain(txtDomain.text);
                      Navigator.of(context).pop();
                      superPrint(txtDomain.text);
                    }),
                  )
                ],
              ),
            ),
          );
        });
  }
}
