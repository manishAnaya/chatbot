import 'package:finva_tech_task/constants/exports.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SideDrawer(),
        ),
        const Expanded(
          flex: 4,
          child: MainSide(),
        ),
      ],
    );
  }
}
