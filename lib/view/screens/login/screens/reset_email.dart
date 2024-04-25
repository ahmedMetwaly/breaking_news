import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/authentication/authentication_state.dart';
import 'package:breaking_news/resources/routes.dart';
import 'package:breaking_news/resources/values_manager.dart';
import 'package:breaking_news/view/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_view/gif_view.dart';

import '../../../../bloc/authentication/authentication_event.dart';
import '../../../../generated/l10n.dart';
import '../../../../resources/image_manager.dart';

class ResetEmail extends StatelessWidget {
  const ResetEmail({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final GifController gifController = GifController(loop: false);

    Future.delayed(
        const Duration(milliseconds: 900), () => gifController.pause());
    return Scaffold(
      appBar: AppBar(
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
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, AuthenticationState state) {
            if (state is ForgetPasswordEmailSent) {
              if (state.email.isNotEmpty) {
                Navigator.of(context).pop();
                showDialog<bool>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(S.current.sent),
                      content: Text(S.current.checkYourEmail),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text(S.current.ok)),
                      ],
                    );
                  },
                );
              }
            }
            if (state is AuthenticationFailureState) {
              Navigator.of(context).pop();
              showDialog<bool>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(S.current.error),
                    content: Text(state.errorMessage),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text(S.current.ok)),
                    ],
                  );
                },
              );
            }
          },
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: GifView.asset(
                ImageManager.mailSent,
                controller: gifController,
                matchTextDirection: true,
                height: 300,
                width: 300,
                frameRate: 30, // default is 15 FPS
              )),
              const SizedBox(height: SizeManager.sSpace),
              Text(S.current.passwordReset,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: SizeManager.sSpace),
              Text(state is ForgetPasswordEmailSent ? state.email : "",
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: SizeManager.sSpace16),
              Text(S.current.passwordResestDetails,
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: SizeManager.sSpace32),
              MyElevatedButton(
                  title: S.current.done,
                  onPress: () {
                    Navigator.of(context).pushReplacementNamed(Routes.logIn);
                  }),
              const SizedBox(height: SizeManager.sSpace16),
              TextButton(
                  onPressed: () {
                    context
                        .read<AuthenticationBloc>()
                        .add(AuthForgetPassword());
                  },
                  child: Text(S.current.resendEmail)),
            ],
          ),
        ),
      )),
    );
  }
}
