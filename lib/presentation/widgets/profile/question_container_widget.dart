import 'package:flutter/material.dart';

import '../../../core/utils/text_style.dart';

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
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: ListTile(
          leading: const Icon(Icons.question_answer),
          subtitle: Text(
            answer,
            style: AppTextStyle.medium,
            textAlign: TextAlign.start,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: AppTextStyle.body,
                textAlign: TextAlign.start,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
