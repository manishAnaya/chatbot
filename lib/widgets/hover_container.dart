import 'package:finva_tech_task/constants/exports.dart';

class HoverContainer extends StatefulWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final Color? color;
  const HoverContainer(
      {super.key, this.child, this.height, this.width, this.color});

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(
        () => _isHovered = true,
      ),
      onExit: (event) => setState(
        () => _isHovered = false,
      ),
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: _isHovered ? darkColor : widget.color ?? Colors.transparent,
        ),
        child: widget.child,
      ),
    );
  }
}
