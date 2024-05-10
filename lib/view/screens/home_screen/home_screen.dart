import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../../resources/values_manager.dart';
import '../favourite_page/favourite_page.dart';
import '../home/home.dart';
import '../profile_page/profile.dart';
import '../search_page/search_page.dart';
import '../topics_page/topics_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  DateTime? currentBackPressTime;
  bool canPopNow = false;
  int requiredSeconds = 2;
  PageController controller = PageController(initialPage: 0);

  void onPopInvoked(bool didPop) {
    DateTime now = DateTime.now();
    if(currentIndex!=0){
      controller.animateToPage(0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastEaseInToSlowEaseOut);
    }
    if ((currentBackPressTime == null ||
        now.difference(currentBackPressTime!) >
            Duration(seconds: requiredSeconds)) && currentIndex ==0) {
      currentBackPressTime = now;
      final snackBar = SnackBar(
          duration: Duration(seconds: requiredSeconds),
          backgroundColor: Theme.of(context).colorScheme.primary,
          content: Text(
            S.current.exit,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.inversePrimary),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      currentIndex = 0;
      controller.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastEaseInToSlowEaseOut);

      Future.delayed(
        Duration(seconds: requiredSeconds),
        () {
          // Disable pop invoke and close the smackbar after 2s timeout
          setState(() {
            canPopNow = false;
          });
        },
      );
      // Ok, let user exit app on the next back press
      setState(() {
        canPopNow = true;
      });
    }
  }
@override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      HomePage(),
      SearchPage(),
      TopicsPage(),
      FavouritePage(),
      ProfilePage(),
    ];
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        activeIcon: const Icon(Icons.home),
        icon: const Icon(Icons.home_outlined),
        label: S.current.home,
      ),
      BottomNavigationBarItem(
        activeIcon: const Icon(Icons.search_rounded),
        icon: const Icon(Icons.search_rounded),
        label: S.current.search,
      ),
      BottomNavigationBarItem(
        activeIcon: const Icon(Icons.topic_rounded),
        icon: const Icon(Icons.topic_outlined),
        label: S.current.topics,
      ),
      BottomNavigationBarItem(
        activeIcon: const Icon(Icons.bookmark_rounded),
        icon: const Icon(Icons.bookmark_border_rounded),
        label: S.current.favorite,
      ),
      BottomNavigationBarItem(
        activeIcon: const Icon(Icons.person),
        icon: const Icon(Icons.person_outline_rounded),
        label: S.current.profile,
      ),
    ];

    return PopScope(
      onPopInvoked: onPopInvoked,
      canPop: canPopNow,
      child: Scaffold(
          extendBody: true,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(SizeManager.radiusOfBNB),
                topRight: Radius.circular(SizeManager.radiusOfBNB),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).colorScheme.outline,
                  offset: SizeManager.shadowOffsetBNB,
                  spreadRadius: SizeManager.sSpace,
                  blurRadius: SizeManager.elevationOfBNB,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(SizeManager.radiusOfBNB),
                topRight: Radius.circular(SizeManager.radiusOfBNB),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
              
                items: items,
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                    // controller.jumpToPage(index);
                    controller.animateToPage(currentIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastEaseInToSlowEaseOut);
                  });
                },
              ),
            ),
          ),
          body: PageView(
              controller: controller,
              children: screens,
              onPageChanged: (value) => setState(() {
                    currentIndex = value;
                  }))),
    );
  }
}