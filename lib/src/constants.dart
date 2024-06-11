import 'package:adya_app/gen/assets.gen.dart';

class Constants {
  static const String angryEmoji = "😡";
  static const String sadEmoji = "😢";
  static const String boredEmoji = "😐";
  static const String happyEmoji = "😄";
  static const String unsureEmoji = "🤔";
  static const String afraidEmoji = "😨";
  static const String relaxedEmoji = "😌";
  static const String worriedEmoji = "😟";
  static const String gratefulEmoji = "🙏";

  static const String videoUrl = Assets.playback;

  static const emojiAnims = <Map<String, dynamic>>[
    {
      "emotion": "Happy",
      "emoji": happyEmoji,
      "videoUrl": videoUrl
    },
    {
      "emotion": "Grateful",
      "emoji": gratefulEmoji,
      "videoUrl": videoUrl
    },
    {
      "emotion": "Relaxed",
      "emoji": relaxedEmoji,
      "videoUrl": videoUrl
    },
    {
      "emotion": "Angry",
      "emoji": angryEmoji,
      "videoUrl": videoUrl
    },
    {
      "emotion": "Sad",
      "emoji": sadEmoji,
      "videoUrl": videoUrl
    },
    {
      "emotion": "Bored",
      "emoji": boredEmoji,
      "videoUrl": videoUrl
    },
    {
      "emotion": "Unsure",
      "emoji": unsureEmoji,
      "videoUrl": videoUrl
    },
    {
      "emotion": "Afraid",
      "emoji": afraidEmoji,
      "videoUrl": videoUrl
    },
    {
      "emotion": "Worried",
      "emoji": worriedEmoji,
      "videoUrl": videoUrl
    },
  ];
}