import 'package:finva_tech_task/constants/exports.dart';

class AnimatedText extends StatelessWidget {
  final String promptResponse;
  const AnimatedText({super.key, required this.promptResponse});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 1, end: promptResponse.length),
      duration: const Duration(seconds: 8),
      builder: (context, val, child) {
        String text = promptResponse.substring(0, val);
        return Text(text, style: normalText);
      },
    );
  }
}
