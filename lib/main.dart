// i dont know why the Icons.mic show the Tick Icon... cant do anything about it :(

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: AnimSearchBar()));
}

class AnimSearchBar extends StatefulWidget {
  const AnimSearchBar({super.key});

  @override
  AnimSearchBarState createState() => AnimSearchBarState();
}

int toggle = 0;

class AnimSearchBarState extends State<AnimSearchBar> with SingleTickerProviderStateMixin {
  late AnimationController _con;
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _con = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 375),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffF2F3F7),
        child: Center(
          child: Container(
            height: 100.0,
            width: 250.0,
            alignment: const Alignment(-1.0, 0.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 375),
              height: 48.0,
              width: (toggle == 0) ? 48.0 : 250.0,
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: -10.0,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 375),
                    top: 6.0,
                    right: 7.0,
                    curve: Curves.easeOut,
                    child: AnimatedOpacity(
                      opacity: (toggle == 0) ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffF2F3F7),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: AnimatedBuilder(
                          builder: (context, widget) {
                            return Transform.rotate(
                              angle: _con.value * 2.0 * pi,
                              child: widget,
                            );
                          },
                          animation: _con,
                          child: const Icon(
                            Icons.mic,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 375),
                    left: (toggle == 0) ? 20.0 : 40.0,
                    curve: Curves.easeOut,
                    top: 11.0,
                    child: AnimatedOpacity(
                      opacity: (toggle == 0) ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      child: SizedBox(
                        height: 23.0,
                        width: 180.0,
                        child: TextField(
                          controller: _textEditingController,
                          cursorRadius: const Radius.circular(10.0),
                          cursorWidth: 2.0,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'Search...',
                            labelStyle: const TextStyle(
                              color: Color(0xff5B5B5B),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                            ),
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 375),
                    left: 4,
                    top: 4,
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      child: IconButton(
                        splashRadius: 19.0,
                        icon: const Icon(
                          Icons.search,
                          size: 24.0,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              if (toggle == 0) {
                                toggle = 1;
                                _con.forward();
                              } else {
                                toggle = 0;
                                _textEditingController.clear();
                                _con.reverse();
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
