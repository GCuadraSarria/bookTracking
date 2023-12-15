import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'pending_publications.dart';
import 'new_publication_form.dart';
import 'my_library.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  final int maxCount = 3;

  void dispose() {
    _pageController.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const PendingPublications(),
    const NewPublicationForm(),
    const MyLibrary(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
                /// Provide NotchBottomBarController
                notchBottomBarController: _controller,
                color: Colors.grey[900]!,
                showLabel: false,
                notchColor: Colors.grey[850]!,

                /// restart app if you change removeMargins
                removeMargins: false,
                bottomBarWidth: 500,
                durationInMilliSeconds: 400,
                showShadow: false,
                bottomBarItems: [
                  /// navigation bar icons
                  bottomBarIcons(Icons.book),
                  bottomBarIcons(Icons.add),
                  bottomBarIcons(Icons.library_books),
                ],
                onTap: (index) {
                  /// perform action on tab change and to update pages you can update pages without pages
                  print('current selected index $index');
                  _pageController.jumpToPage(index);
                },
              )
            : null,
      ),
    );
  }
}

BottomBarItem bottomBarIcons(IconData icon) {
  return BottomBarItem(
    inActiveItem: Icon(
      icon,
      color: const Color.fromRGBO(255, 192, 203, 0.75),
    ),
    activeItem: Icon(
      icon,
      color: Colors.pink[300],
    ),
    itemLabel: '',
  );
}
