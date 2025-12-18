import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_initial/navigation.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:pinput/pinput.dart';

class OnboardingPageModel {
  final int index;
  final String title;
  final String description;
  final String imagePath;
  final String buttonText;
  final Color textColor;

  OnboardingPageModel({
    required this.index,
    required this.title,
    required this.description,
    this.imagePath = '',
    required this.buttonText,
    this.textColor = Colors.white,
  });
}

class OnboardingScreen extends StatefulWidget {
  final List<OnboardingPageModel> pages;

  OnboardingScreen({super.key, required this.pages});

  final _pageController = PageController();

  @override
  State<OnboardingScreen> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.pages.length,
                onPageChanged: (idx) {
                  setState(() {
                    _currentPage = idx;
                  });
                },
                itemBuilder: (context, idx) {
                  final item = widget.pages[idx];
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: item.index != 3
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  item.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Expanded(child: SizedBox()),
                      ),
                      Positioned.fill(
                        child: Container(
                          color: item.index != 3
                              ? Colors.black.withOpacity(0.6)
                              : Colors.white.withOpacity(0.6),
                        ),
                      ),
                      Positioned.fill(
                          top: 200,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                item.index != 1
                                    ? Padding(
                                        padding: EdgeInsets.only(top: 230),
                                        child: Column(
                                          children: [
                                            Text(
                                              item.title,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.inter(
                                                  fontSize: 34,
                                                  fontWeight: FontWeight.w700,
                                                  color: item.textColor,
                                                  height: 1.2),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              item.description,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.inter(
                                                fontSize: 22,
                                                color: item.textColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding: EdgeInsetsGeometry.only(
                                            top: 120, right: 150, left: 10),
                                        child: Text(
                                            'EXPLORE ET\nCHOISIS EN\nTOUTE\nCONFIANCE',
                                            style: GoogleFonts.bebasNeue(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge,
                                              fontSize: 61.5,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            )),
                                      ),
                                SizedBox(
                                  height: 150,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 1),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF3655B3),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 15),
                                      ),
                                      onPressed: () {
                                        if (idx == widget.pages.length - 1) {
                                          Get.offNamed(Routes.REGISTER);
                                        } else {
                                          _pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                        }
                                      },
                                      child: item.index != 3
                                          ? Text(
                                              item.buttonText,
                                              style: GoogleFonts.poppins(
                                                color: item.textColor,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          : Text(
                                              item.buttonText,
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: widget.pages
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return AnimatedContainer(
                                        duration: Duration(milliseconds: 250),
                                        width:
                                            _currentPage == entry.key ? 35 : 10,
                                        height: 10,
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 3),
                                        decoration: BoxDecoration(
                                          color: _currentPage == entry.key
                                              ? const Color(0xFF3655B3)
                                              : Colors.grey.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
