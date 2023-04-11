import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/check_sign_in_prov.dart';
import '../utils/routes/routes_name.dart';
import '../utils/size_config.dart';
import 'onboard_content.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController _controller;

  void _onIntroEnd(context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteName.login,
      (route) => false,
    );
  }

  @override
  void didChangeDependencies() {
    Provider.of<SplashProvider>(context, listen: false).splashTimer(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: _currentPage == index ? Colors.green : Colors.grey,
      ),
      margin: const EdgeInsets.only(right: 10),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  Widget _buildImage(String image, [double width = 300]) {
    return Image.asset(image, width: width);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double width = SizeConfig.screenWidth!;
    // double height = SizeConfig.screenHeight!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemCount: contents.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildImage(contents[i].image),
                          // SizedBox(
                          //   height: (height >= 840) ? 60 : 30,
                          // ),
                          const SizedBox(height: 25),
                          Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            contents[i].desc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 19.0),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 12, right: 12),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _currentPage > 0
                          ? SizedBox(
                              width: 60,
                              child: IconButton(
                                alignment: Alignment.centerLeft,
                                onPressed: () {
                                  // print(_currentPage);

                                  _controller.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                                icon: const Icon(
                                  CupertinoIcons.arrow_left,
                                  color: Colors.green,
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 60,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                onPressed: () {},
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contents.length,
                            (int index) => _buildDots(
                              index: index,
                            ),
                          ),
                        ),
                      ),
                      _currentPage == contents.length - 1
                          ? SizedBox(
                              width: 60,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                onPressed: () => _onIntroEnd(context),
                                child: const Text(
                                  'Done',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 60,
                              child: IconButton(
                                style: IconButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                                icon: const Icon(
                                  CupertinoIcons.arrow_right,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  child: const Text(
                    'Let\'s go right away!',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: _buildImage(
                    'assets/images/app_logo/vegipak-black-border-carrot.png',
                    80),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
