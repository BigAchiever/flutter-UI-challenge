import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../services/data/data_local.dart';
import '../utils/color.dart';
import '../utils/theme.dart';

class DetailScreen extends StatefulWidget {
  final int currentPage;

  const DetailScreen({
    super.key,
    required this.currentPage,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

bool isContentVisible = false;

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: 'card${widget.currentPage}',
      child: Scaffold(
        backgroundColor: const Color(0xfffffefe),
        body: Visibility(
          visible: isContentVisible,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20.0, right: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                          setState(() {
                            isContentVisible = false;
                          });
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
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
                          color: progressColors[
                              widget.currentPage % progressColors.length],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "9 Tasks",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Personal",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: ThemeClass.largeTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearPercentIndicator(
                        lineHeight: 3,
                        percent: 0.7,
                        curve: Curves.easeIn,
                        barRadius: const Radius.circular(8),
                        fillColor: Colors.transparent,
                        progressColor: progressColors[
                            widget.currentPage % progressColors.length],
                        trailing: Text(
                          "70%",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Today",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: checkboxList.map((checkbox) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: BorderDirectional(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: CheckboxListTile(
                                  side: BorderSide(
                                    color: Colors.grey.shade500,
                                    width: 2,
                                  ),
                                  value: checkbox.enabled,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkbox.enabled = value!;
                                    });
                                  },
                                  title: Text(checkbox.title,
                                      style: TextStyle(
                                          color: Colors.grey.shade700)),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  enabled: true,
                                  checkboxShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Tomorrow",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Column(
                            children: checkboxList2.map((checkbox) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: BorderDirectional(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: CheckboxListTile(
                                  side: BorderSide(
                                    color: Colors.grey.shade500,
                                    width: 2,
                                  ),
                                  value: checkbox.enabled,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkbox.enabled = value!;
                                    });
                                  },
                                  title: Text(checkbox.title,
                                      style: TextStyle(
                                          color: Colors.grey.shade700)),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  enabled: true,
                                  checkboxShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
