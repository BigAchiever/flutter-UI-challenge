import 'package:flutter/material.dart';
import 'package:todo_ui_challenge/widgets/card_widget.dart';
import '../services/functions/functions.dart';
import '../utils/color.dart';
import '../widgets/card_align.dart';
import 'card_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

@override
void dispose() {
  Scrollfunc.pageController.dispose();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    Scrollfunc.pageController.dispose();
    super.dispose();
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient:
              backgroundGradients[currentPage % backgroundGradients.length],
        ),
        child: SafeArea(
          child: GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx.abs() > 2 * details.delta.dy.abs()) {
                // Horizontal swipe
                if (details.delta.dx < 0) {
                  Scrollfunc.nextPage();
                } else {
                  Scrollfunc.prevPage();
                }
              } else {
                isContentVisible = true;
                // Vertical swipe
                if (details.delta.dy < 0 && details.delta.dy.abs() > 2) {
                  // Swipe upwards
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 800),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final scaleAnimation =
                            Tween<double>(begin: 0.8, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animation, curve: Curves.easeInOut),
                        );

                        final fadeAnimation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animation, curve: Curves.easeInOut),
                        );

                        return ScaleTransition(
                          scale: scaleAnimation,
                          child: FadeTransition(
                            opacity: fadeAnimation,
                            child: child,
                          ),
                        );
                      },
                      pageBuilder: (context, animation1, animation2) =>
                          DetailScreen(
                        currentPage: currentPage,
                      ),
                    ),
                  );
                }
              }
            },
            child: PageView(
              controller: Scrollfunc.pageController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                  print('Current Page: $currentPage');
                });
              },
              children: [
                CenteredCard(
                  currentpagenumber: 0,
                ),
                CenteredCard(
                  currentpagenumber: 1,
                ),
                CenteredCard(
                  currentpagenumber: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
