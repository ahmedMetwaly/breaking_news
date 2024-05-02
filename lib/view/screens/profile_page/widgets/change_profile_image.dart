import 'package:breaking_news/bloc/firestore/firestore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../bloc/authentication/authentication_bloc.dart';
import '../../../../bloc/firestore/firestore_bloc.dart';
import '../../../../bloc/firestore/firestore_event.dart';
import '../../../widgets/image_from_network.dart';

class ChangeProfileImageWidget extends StatelessWidget {
  const ChangeProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirestoreBloc, FirestoreState>(
      builder: (context, state) {
        print(state);
        if (state is UpdatindDataState) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
          );
        }
        return GestureDetector(
          onTap: () async {
            final ImagePicker picker = ImagePicker();
            await picker
                .pickImage(
              source: ImageSource.gallery, // Or ImageSource.camera
            )
                .then((value) {
              if (value != null) {
                context.read<FirestoreBloc>().profileImage = value;
                context.read<FirestoreBloc>().add(ChangeProfileImage());
              }
              return null;
            });
          },
          child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: ImageFromNetwork(
                imagePath: AuthenticationBloc.user.imageUrl ?? "",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(Icons.edit,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ]),
        );
      },
    );
  }
}
