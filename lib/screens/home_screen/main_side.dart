import 'dart:io';
import 'package:finva_tech_task/constants/exports.dart';

class MainSide extends StatefulWidget {
  const MainSide({super.key});

  @override
  State<MainSide> createState() => _MainSideState();
}

class _MainSideState extends State<MainSide> {
  final msgController = TextEditingController();
  final c = Get.put(PromptController());
  File? selectedImg;
  pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final tempImage = File(image.path);
    setState(
      () => selectedImg = tempImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT 3.5'),
      ),
      drawer: Responsive.isDesktop(context) ? null : SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => c.promptData.isNotEmpty
              ? buildPromptView(size)
              : Column(
                  children: [
                    const Spacer(),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage(appLogo),
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    Text('How can I help you today?', style: largeBoldText),
                    const Spacer(),
                    SizedBox(
                      width: 750,
                      child: Expanded(
                        child: Column(
                          children: [
                            defaultPrompts(),
                            const SizedBox(height: defaultPadding * 2),
                            selectedImg == null
                                ? Container()
                                : Platform.isAndroid
                                    ? Image.file(selectedImg!,
                                        height: 85,
                                        width: 85,
                                        fit: BoxFit.cover)
                                    : Text(selectedImg!.path),
                            const SizedBox(height: defaultPadding * 2),
                            SizedBox(
                              width: 750,
                              child: chatGPTTextBox(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'ChatGPT can make mistakes, Consider checking important information',
                                style: normalLightText,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: Responsive.isDesktop(context) ? false : true,
        tooltip: 'Give your feedback',
        onPressed: () => BetterFeedback.of(context).show(
          (feedback) =>
              Fluttertoast.showToast(msg: '$feedback saved successfully...'),
        ),
        child: SvgPicture.asset(feedIcon, height: 25),
      ),
    );
  }

  Stack buildPromptView(Size size) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: size.height - 150,
            width: 750,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: c.promptData.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(myImg),
                        ),
                        const SizedBox(width: defaultPadding),
                        Text('You', style: mediumBoldText)
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child:
                          Text(c.promptData[index].prompt, style: normalText),
                    ),
                    const SizedBox(height: 35),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(appLogo),
                        ),
                        const SizedBox(width: defaultPadding),
                        Text('ChatGPT', style: mediumBoldText)
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: AnimatedText(
                          promptResponse: c.promptData[index].response),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 750,
            child: chatGPTTextBox(),
          ),
        ),
      ],
    );
  }

  GridView defaultPrompts() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isDesktop(context) ? 2 : 1,
        childAspectRatio: Responsive.isDesktop(context) ? 5 : 7.5,
        mainAxisSpacing: defaultMargin,
        crossAxisSpacing: defaultMargin,
      ),
      itemCount: inputs.length,
      itemBuilder: (context, index) => MouseRegion(
        onEnter: (event) => setState(() => inputs[index].isHover = true),
        onExit: (event) => setState(() => inputs[index].isHover = false),
        child: Tooltip(
          message: 'Click to send',
          child: GestureDetector(
            onTap: () =>
                c.addPrompt('${inputs[index].title} ${inputs[index].subtitle}'),
            child: Container(
              padding: const EdgeInsets.only(left: defaultPadding * 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: inputs[index].isHover
                      ? Colors.black12
                      : Colors.transparent,
                  border: Border.all(color: Colors.black26),
                  borderRadius: borderRadius),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(inputs[index].title, style: mediumBoldText),
                      Text(inputs[index].subtitle, style: normalLightText),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField chatGPTTextBox() {
    return TextFormField(
      controller: msgController,
      validator: (value) =>
          value!.isEmpty ? 'Please enter something before proceeding' : null,
      style: mediumBoldText,
      onEditingComplete: () {
        msgController.text.isEmpty ? null : c.addPrompt(msgController.text);
        msgController.clear();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusColor: blackColor,
        hintText: 'Message ChatGPT...',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        suffixIcon: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: borderRadius,
                ),
                child: MouseRegion(
                  child: Tooltip(
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    message: 'Upload Image',
                    child: GestureDetector(
                        onTap: () => pickImage(ImageSource.gallery),
                        child: const Icon(Icons.photo_library)),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: borderRadius,
                ),
                child: MouseRegion(
                  child: Tooltip(
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    message: 'Send Message',
                    child: GestureDetector(
                        onTap: () {
                          msgController.text.isEmpty
                              ? null
                              : c.addPrompt(msgController.text);
                          msgController.clear();
                        },
                        child: const Icon(Icons.arrow_upward)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
