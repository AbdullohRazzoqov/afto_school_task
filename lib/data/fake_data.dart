class TestDate {
  int trueAnswers;
  String question;
  List<String> answers;
  String? mediaUrl;
  TestDate({
    required this.question,
    required this.answers,
    required this.trueAnswers,
    this.mediaUrl,
  });
}

List<TestDate> questions = [
  TestDate(
    trueAnswers: 0,
    question: "What is the capital of Uzbekistan?",
    answers: ['Toshkent', 'Samarqand', 'Navoiy', 'Termiz'],
  ),
  TestDate(
      trueAnswers: 0,
      question: "Belgi manosi",
      answers: [
        'qaylanma harakatga kirish',
        'mumkun emas',
        'to\'g\'ri yuish',
        'orqaga burilish'
      ],
      mediaUrl: 'assets/vedio/test.mp4'),
  TestDate(
    trueAnswers: 0,
    question: "What is the capital of Uzbekistan?",
    answers: ['Toshkent', 'Samarqand', 'Navoiy', 'Termiz'],
  ),
  TestDate(
    trueAnswers: 2,
    question: "Piyoda qizilda o'tishi  mumkunmi",
    answers: ['ha', "yo'q", 'Zarurat bo\'lganda', 'moshina bo\'lmaganda'],
  )
];
