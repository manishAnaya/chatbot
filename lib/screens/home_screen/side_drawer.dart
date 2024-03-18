import 'package:finva_tech_task/constants/exports.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({super.key});
  final c = Get.put(PromptController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        surfaceTintColor: darkColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => c.resetPrompt(),
                child: HoverContainer(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: whiteColor,
                        backgroundImage: AssetImage(appLogo),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        child: Text('New Chat', style: mediumBoldText),
                      ),
                      const Spacer(),
                      SvgPicture.asset(editIcon, height: 20)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: c.promptData.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: HoverContainer(
                      color: Colors.black12,
                      child: Text(c.promptData[index].prompt,
                          style: normalText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              HoverContainer(
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(defaultPadding),
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(upgardeIcon),
                    ),
                    const SizedBox(width: defaultPadding),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Upgrade Plan', style: mediumBoldText),
                        Text('Get GPT-4 and more', style: normalLightText),
                      ],
                    ),
                  ],
                ),
              ),
              HoverContainer(
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(myImg),
                    ),
                    const SizedBox(width: defaultPadding),
                    Text('Manish Agrahari', style: mediumBoldText),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
