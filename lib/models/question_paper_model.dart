// import 'package:cloud_firestore/cloud_firestore.dart';

// class QuestionPaperModel {
//   String? id;
//   String? title;
//   String? imageUrl;
//   String? description;
//   int? timeSeconds;
//   List<Questions>? questions;
//   int questionCount;

//   QuestionPaperModel(
//       {this.id,
//       this.title,
//       this.imageUrl,
//       this.description,
//       this.timeSeconds,
//       this.questions,
//       required this.questionCount});

//   QuestionPaperModel.fromJson(Map<String, dynamic> json)
//       : id = json['id'] as String,
//         title = json['title'] as String,
//         imageUrl = json['image_url'] as String,
//         description = json['Description'] as String,
//         timeSeconds = json['time_seconds'],
//         questionCount = 0,
//         // if (json['questions'] != null) {
//         //   questions = <Questions>[];
//         //   json['questions'].forEach((v) {
//         //     questions!.add(Questions.fromJson(v));
//         //   });
//         // }
//         questions = (json['questions'] as List)
//             .map((e) => Questions.fromJson(e as Map<String, dynamic>))
//             .toList();
//   QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
//       : id = json.id,
//         title = json['title'],
//         imageUrl = json['image_url'],
//         description = json['Description'],
//         timeSeconds = json['time_seconds'],
//         questionCount = json['question_count'] as int,
//         questions = [];
//   String timeInMinits() => "${(timeSeconds! / 60).ceil()} mins";

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['image_url'] = imageUrl;
//     data['Description'] = description;
//     data['time_seconds'] = timeSeconds;
//     if (questions != null) {
//       data['questions'] = questions!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Questions {
//   String? id;
//   String? question;
//   List<Answers>? answers;
//   String? correctAnswer;

//   Questions({this.id, this.question, this.answers, this.correctAnswer});

//   Questions.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         question = json['question'],
//         // if (json['answers'] != null) {
//         //   answers = <Answers>[];
//         //   json['answers'].forEach((v) {
//         //     answers!.add(Answers.fromJson(v));
//         //   });
//         // }
//         answers =
//             (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
//         correctAnswer = json['correct_answer'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['question'] = question;

//     data['correct_answer'] = correctAnswer;
//     return data;
//   }
// }

// class Answers {
//   String? identifier;
//   String? answer;

//   Answers({this.identifier, this.answer});

//   Answers.fromJson(Map<String, dynamic> json)
//       : identifier = json['identifier'],
//         answer = json['Answer'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['identifier'] = identifier;
//     data['Answer'] = answer;
//     return data;
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Questions>? questions;
  int questionCount;
  QuestionPaperModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.timeSeconds,
      required this.questionCount,
      this.questions});

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String,
        description = json['description'],
        timeSeconds = json['time_seconds'],
        questionCount = 0,
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['description'],
        timeSeconds = json['time_seconds'],
        questionCount = json['questions_count'] as int,
        questions = [];
  String timeInMinutes() => "${(timeSeconds / 60).ceil()} mins";
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['Description'] = description;
    data['time_seconds'] = timeSeconds;
    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String? correctAnswer;
  String? selectedAnswer;

  Questions(
      {required this.id,
      required this.question,
      required this.answers,
      this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers =
            (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];
  Questions.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        question = snapshot['question'],
        answers = [],
        correctAnswer = snapshot['correct_answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    if (answers != null) {
      data['answers'] = answers.map((v) => v.toJson()).toList();
    }
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['answer'];
  Answers.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : answer = snapshot['answer'] as String?,
        identifier = snapshot['identifier'] as String?;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['answer'] = answer;
    return data;
  }
}
