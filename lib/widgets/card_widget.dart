import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_ui_challenge/utils/theme.dart';

import '../utils/color.dart';
import '../utils/constants.dart';

cardWidget(
  BuildContext context,
  int currentpagenumber,
) =>
    Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Card(
        elevation: 50,
        color: ThemeClass.cardColor,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      transitionOnUserGestures: true,
                      tag: herotags[currentpagenumber % herotags.length],
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black12,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 25,
                          color: progressColors[
                              currentpagenumber % progressColors.length],
                        ),
                      ),
                    ),
                    Hero(
                      transitionOnUserGestures: true,
                      tag: 'more$currentpagenumber',
                      child: const Icon(
                        Icons.more_vert,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Hero(
                          transitionOnUserGestures: true,
                          tag: 'taskCount$currentpagenumber',
                          flightShuttleBuilder: (flightContext,
                                  animation,
                                  flightDirection,
                                  fromHeroContext,
                                  toHeroContext) =>
                              Material(
                            color: Colors.transparent,
                            child: toHeroContext.widget,
                          ),
                          child: const Text(
                            "9 Tasks",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Hero(
                          transitionOnUserGestures: true,
                          tag: 'title$currentpagenumber',
                          flightShuttleBuilder: (flightContext,
                                  animation,
                                  flightDirection,
                                  fromHeroContext,
                                  toHeroContext) =>
                              Material(
                            color: Colors.transparent,
                            child: toHeroContext.widget,
                          ),
                          child: const Text(
                            "Personal",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: ThemeClass.largeTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Hero(
                      transitionOnUserGestures: true,
                      tag:
                          progresstags[currentpagenumber % progresstags.length],
                      child: LinearPercentIndicator(
                        lineHeight: 3,
                        percent: 0.7,
                        curve: Curves.easeIn,
                        barRadius: const Radius.circular(8),
                        fillColor: Colors.transparent,
                        progressColor: progressColors[
                            currentpagenumber % progressColors.length],
                        trailing: Text(
                          "70%",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
