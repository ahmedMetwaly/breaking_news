import 'package:breaking_news/bloc/authentication/authentication_bloc.dart';
import 'package:breaking_news/bloc/authentication/authentication_state.dart';
import 'package:breaking_news/resources/routes.dart';
import 'package:breaking_news/resources/values_manager.dart';
import 'package:breaking_news/view/widgets/elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_view/gif_view.dart';
import '../../../../bloc/authentication/authentication_event.dart';
import '../../../../generated/l10n.dart';
import '../../../../resources/image_manager.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    late GifController gifController;
    gifController = GifController(
        onFrame: (value) => value == 24 ? gifController.pause() : null);

    context.read<AuthenticationBloc>().add(AuthSendEmailVerfication());
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: const SizedBox(),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, AuthenticationState state) {
            Navigator.of(context).canPop() ? Navigator.of(context).pop() : null;
            if (state is EmailVerficationSent) {
              if (state.email.isNotEmpty) {
                /* Navigator.of(context).pop();
                showDialog<bool>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(S.current.sent),
                      content: Text(S.current.emailVerficationSent),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text(S.current.ok)),
                      ],
                    );
                  },
                ); */
                /* Navigator.of(context).canPop()
                    ? Navigator.of(context).pop()
                    : null; */
               /*  if (FirebaseAuth.instance.currentUser!.emailVerified) {
                  Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
                } else {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.verifyEmail);

                  /*  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    S.current.emailVerficationSent,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))); */
                } */
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  S.current.emailVerficationSent,
                  style: Theme.of(context).textTheme.bodyMedium,
                )));
              }
            }
            if (state is AuthenticationFailureState) {
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
              Text(S.current.emailVerficationSent,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: SizeManager.sSpace),
              Text(state is EmailVerficationSent ? state.email : "",
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: SizeManager.sSpace16),
              Text(S.current.emailVerficationDescription,
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: SizeManager.sSpace32),
              MyElevatedButton(
                  title: S.current.done,
                  onPress: () {
                    if (FirebaseAuth.instance.currentUser!.emailVerified==true) {
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.homeScreen);
                    } else {
                      Navigator.of(context).pushReplacementNamed(Routes.logIn);
                    }
                  }),
              const SizedBox(height: SizeManager.sSpace16),
              TextButton(
                  onPressed: () {
                    context
                        .read<AuthenticationBloc>()
                        .add(AuthSendEmailVerfication());
                  },
                  child: Text(S.current.resendEmail)),
            ],
          ),
        ),
      )),
    );
  }
}
