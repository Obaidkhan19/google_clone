import 'package:flutter/material.dart';
import 'package:google_clone/widget/language_text.dart';


class TranslationButtons extends StatelessWidget {
  const TranslationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WRAP = WORDS WILL GO DOWN AS SCREEN WIDTH DECREASES
    return Wrap(
      alignment: WrapAlignment.center,
      children: const [
        Text('Google Offered in'),
        SizedBox(width: 5),
        LanguageText(title: 'العَرَبِيَّة'),
        SizedBox(width: 5),
        LanguageText(title: 'بلۏچی'),
        SizedBox(width: 5),
        LanguageText(title: 'دری'),
        SizedBox(width: 5),
        LanguageText(title: '馬祖話'),
        SizedBox(width: 5),
        LanguageText(title: 'தமிழ்'),
        SizedBox(width: 5),
        LanguageText(title: 'پښتو'),
        SizedBox(width: 5),
        LanguageText(title: 'فارسی'),
        SizedBox(width: 5),
        LanguageText(title: 'اُردُو'),
        SizedBox(width: 5),
        LanguageText(title: 'Oʻzbekcha Ўзбекча'),
      ],
    );
  }
}
