import 'package:finva_tech_task/constants/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileView(),
      tablet: TabletView(),
      desktop: DesktopView(),
    );
  }
}
