import "package:breaking_news/bloc/authentication/authentication_bloc.dart";
import "package:breaking_news/bloc/authentication/authentication_state.dart";
import "package:breaking_news/resources/image_manager.dart";
import "package:breaking_news/resources/routes.dart";
import "package:breaking_news/resources/values_manager.dart";
import "package:breaking_news/view/widgets/elevated_button.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:gif_view/gif_view.dart';
import "../../../../bloc/authentication/authentication_event.dart";
import "../../../../generated/l10n.dart";
import "../widgets/email.dart";

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    
    final formKey = GlobalKey<FormState>();
     late GifController gifController;
    gifController = GifController(onFrame: (value) => value==24 ? gifController.pause():null);
   return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.forgotPassword,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leadingWidth: 0,
        leading: const SizedBox(),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: SingleChildScrollView(
          child: BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (BuildContext context, AuthenticationState state) {
              if (state is ForgetPasswordEmailSent) {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(Routes.resetEmail);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.forgotPasswordDetails,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Center(
                    child: GifView.asset(
                  ImageManager.forgetPassword,
                  controller: gifController,
                  matchTextDirection: true,
                  height: 300,
                  width: 300,
                  frameRate: 30, // default is 15 FPS
                )),
                const SizedBox(height: SizeManager.sSpace16),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Email(inputController: email),
                ),
                const SizedBox(
                  height: SizeManager.sSpace32,
                ),
                MyElevatedButton(
                    title: S.current.confirm,
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        print("validate");
                        AuthenticationBloc.user.email = email.text.trim();
                        context
                            .read<AuthenticationBloc>()
                            .add(AuthForgetPassword());
                      }
                    }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
