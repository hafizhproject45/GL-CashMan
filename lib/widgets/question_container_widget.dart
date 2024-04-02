import 'package:flutter/material.dart';
import 'package:gl_app/styles/text_styles.dart';

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
      padding: EdgeInsets.only(bottom: 15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ListTile(
          title: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              question,
              style: TextBlack.upperThin,
            ),
          ),
          leading: Icon(Icons.question_answer),
          subtitle: Text(
            answer,
            style: TextGrey.thin,
          ),
        ),
      ),
    );
  }
}
