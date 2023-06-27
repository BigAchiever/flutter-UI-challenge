import 'package:flutter/material.dart';
import 'package:todo_ui_challenge/widgets/appbar_widget.dart';
import 'package:todo_ui_challenge/widgets/date_display_widget.dart';
import 'package:todo_ui_challenge/widgets/icon_widget.dart';
import 'package:todo_ui_challenge/widgets/name_widget.dart';
import 'package:todo_ui_challenge/widgets/quote_widget.dart';
import '../services/functions/functions.dart';
import '../utils/color.dart';
import '../widgets/card_align.dart';
import 'card_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;

  @override
  void dispose() {
    Scrollfunc.pageController.dispose();
    super.dispose();
  }

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
          child: Stack(
            children: [
              appBarWidget(context),
              iconWidget(context),
              nameWidget(context),
              quoteWidget(context),
              dateDisplay(context),
              GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dx.abs() > 10 * details.delta.dy.abs()) {
                    // Horizontal swipe
                    if (details.delta.dx < 0) {
                      Scrollfunc.nextPage();
                    } else {
                      Scrollfunc.prevPage();
                    }
                  } else {
                    isContentVisible = true;
                    // Vertical swipe
                    if (details.delta.dy < -10 && details.delta.dy.abs() > 2) {
                      // Swipe upwards
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(seconds: 1),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 800),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return AnimatedSize(
                              duration: const Duration(milliseconds: 1),
                              child: DetailScreen(
                                currentPage: currentPage,
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                },
                child: PageView(
                  controller: Scrollfunc.pageController,
                  scrollDirection: Axis.horizontal,
                  restorationId: 'home',
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                      debugPrint('Current Page: $currentPage');
                    });
                  },
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 50.0),
                        CenteredCard(currentpagenumber: 0),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 50.0),
                        CenteredCard(currentpagenumber: 1),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 50.0),
                        CenteredCard(currentpagenumber: 2),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
