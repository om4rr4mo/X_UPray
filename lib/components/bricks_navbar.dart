import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarCurvedFb1 extends StatefulWidget {
  final PageController pageController;

  const BottomNavBarCurvedFb1({Key? key, required this.pageController})
      : super(key: key);

  @override
  _BottomNavBarCurvedFb1State createState() => _BottomNavBarCurvedFb1State();
}

class _BottomNavBarCurvedFb1State extends State<BottomNavBarCurvedFb1> {
  //
  // WARNING! MUST ADD extendBody: true; TO CONTAINING SCAFFOLD
  //
  // Instructions:
  //
  // add this widget to the bottomNavigationBar property of a Scaffold, along with
  // setting the extendBody parameter to true i.e:
  //
  // Scaffold(
  //  extendBody: true,
  //  bottomNavigationBar: BottomNavBarCurvedFb1()
  // )
  //
  // Properties such as color and height can be set by changing the properties at the top of the build method
  //
  // For help implementing this in a real app, watch https://www.youtube.com/watch?v=C0_3w0kd0nc. The style is different, but connecting it to navigation is the same.
  //

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      widget.pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    final primaryColor = Theme.of(context).selectedRowColor.withOpacity(0.3);
    final secondaryColor = Theme.of(context).unselectedWidgetColor;
    final accentColor = Colors.white10;
    final backgroundColor = Colors.white10;

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height + 6),
            painter: BottomNavCurvePainter(backgroundColor: backgroundColor),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
                backgroundColor: primaryColor,
                child: Icon(FontAwesomeIcons.home),
                elevation: 0.1,
                onPressed: () => _onItemTapped(0)),
          ),
          Container(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  text: "Qibla",
                  icon: FontAwesomeIcons.compass,
                  selected: true,
                  onPressed: () => _onItemTapped(1),
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                    text: "Corano",
                    icon: FontAwesomeIcons.book,
                    selected: false,
                    onPressed: () => _onItemTapped(2),
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor),
                SizedBox(width: 56),
                NavBarIcon(
                  text: "Tracker",
                  icon: FontAwesomeIcons.prayingHands,
                  selected: false,
                  onPressed: () => _onItemTapped(3),
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Impostazioni",
                  icon: Icons.settings,
                  selected: false,
                  onPressed: () => _onItemTapped(4),
                  selectedColor: primaryColor,
                  defaultColor: secondaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;
    path.quadraticBezierTo(size.width * 0.20, 0,
        insetCurveBeginnningX - transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(
        insetCurveBeginnningX, 0, insetCurveBeginnningX, insetRadius / 2);

    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); // +56 here extends the navbar below app bar to include extra space on some screens (iPhone 11)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
