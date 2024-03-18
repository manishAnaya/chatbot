import 'package:finva_tech_task/constants/exports.dart';

const appName = 'Finva-Tech Task';
const defaultPadding = 8.00;
const defaultMargin = 8.00;
const defaultRadius = 8.00;
const defaultCardRadius = 12.00;
const xsmallTextsize = 10.00;
const smallTextsize = 12.00;
const normalTextsize = 14.00;
const mediumTextsize = 16.00;
const largeTextsize = 18.00;
const xLargeTextsize = 22.00;
final borderRadius = BorderRadius.circular(defaultRadius);
const maxWidth = 1440.0;
const chatGptApiKey = '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';

List<DemoInput> inputs = [
  DemoInput(
    title: 'Suggest some names',
    subtitle: 'for my cafe-by-day, bar-by-night business',
    isHover: false,
  ),
  DemoInput(
    title: 'Help me pick',
    subtitle: 'an outfit that will look good on camera',
    isHover: false,
  ),
  DemoInput(
    title: 'Recommend a dish',
    subtitle: 'to impress a date who is picky eater',
    isHover: false,
  ),
  DemoInput(
    title: 'Give me ideas',
    subtitle: 'about how to plan my new years resolutions',
    isHover: false,
  ),
];

class DemoInput {
  final String title;
  final String subtitle;
  bool isHover;
  DemoInput(
      {required this.title, required this.subtitle, required this.isHover});
}
