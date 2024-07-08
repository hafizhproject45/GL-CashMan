import 'package:flutter/material.dart';

import '../../core/utils/text_style.dart';

class QuestionContainerWidget extends StatelessWidget {
  final String question;
  final String answer;

  const QuestionContainerWidget({
    required this.question,
    required this.answer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              question,
              style: AppTextStyle.body,
            ),
          ),
          leading: const Icon(Icons.question_answer),
          subtitle: Text(
            answer,
            style: AppTextStyle.medium,
          ),
        ),
      ),
    );
  }
}
