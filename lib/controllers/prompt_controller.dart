import 'dart:convert';
import 'package:finva_tech_task/constants/exports.dart';
import 'package:http/http.dart' as http;

class PromptModel {
  final String prompt;
  final String response;

  PromptModel({required this.prompt, required this.response});
}

class PromptController extends GetxController {
  RxList<PromptModel> promptData = <PromptModel>[].obs;

  addPrompt(String prompt) {
    promptData.add(PromptModel(prompt: prompt, response: response));
  }

  resetPrompt() {
    promptData.clear();
    Get.back();
  }

//   Future<void> sendMessage(String message) async {
//     var headers = {
//       'Content-Type': 'application/json',
//       'Authorization':
//           'Bearer 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',
//       'Cookie':
//           '__cf_bm=y.XFgKqNal_SVqkGgpqgVoTh52kyxRSwmze.c.5Gm4c-1709710686-1.0.1.1-NgspfRtNg30HCSi7mUx5xWZi.O7zbsM5gQsF2BwXLiHAlQJW13E_iSoCRI7fRfpDUsZr5W6USTKnbuIc2Fg0eQ; _cfuvid=1sDJzMRqseViZJAmidLbDyoolla81LFslGT2tP8tHMY-1709710686986-0.0.1.1-604800000'
//     };
//     const url = 'https://api.openai.com/v1/chat/completions';
//     var request = http.Request('POST', Uri.parse(url));
//     request.body = json.encode({
//       "model": "gpt-3.5-turbo",
//       "messages": [
//         {"role": "user", "content": message}
//       ]
//     });
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       final jsonData = await response.stream.bytesToString();
//       final data = jsonDecode(jsonData);
//       // messages.add(message);
//       Fluttertoast.showToast(msg: data);
//     } else {
//       Fluttertoast.showToast(msg: response.reasonPhrase!);
//     }
//   }
// }

  String response = """
Absolutely, here are some demo lines showcasing ChatGPT's conversational abilities:


1. Casual Conversation:
   - User: Hey ChatGPT, how's it going?
   - ChatGPT: Hi there! I'm doing well, ready to chat. What's on your mind?

2. Information Inquiry:
   - User: Can you tell me about the history of artificial intelligence?
   - ChatGPT: Sure! Artificial intelligence, or AI, has roots dating back to ancient times, but modern AI started in the mid-20th century. It has since evolved, encompassing various fields like machine learning and natural language processing.

3. Assistance Request:
   - User: I need help planning a trip. Where should I start?
   - ChatGPT: Great! To start planning your trip, consider the destination, budget, and duration. Are you looking for specific recommendations or general tips?

4. Creative Writing Prompt:
   - User: Give me a creative writing prompt, something unique.
   - ChatGPT: How about this: In a world where emotions are traded as commodities, you discover a marketplace where people exchange joy, sorrow, and everything in between. Write a story about your experience navigating this emotional marketplace.

5. Philosophical Question:
   - User: What is the meaning of life, ChatGPT?
   - ChatGPT: Ah, the age-old question! The meaning of life is subjective and varies for each person. Some find purpose in relationships, others in personal growth. What do you think gives life meaning?
""";
}
