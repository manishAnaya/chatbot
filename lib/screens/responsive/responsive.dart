import 'package:finva_tech_task/constants/exports.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1145;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1145;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width >= 1145) {
      return desktop;
    } else if (size.width >= 700) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
