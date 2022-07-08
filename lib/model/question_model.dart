class QuestionModel {
  String? id;
  String? startQuestionId;
  List<Questions>? questions;
  Strings? strings;

  QuestionModel({this.id, this.startQuestionId, this.questions, this.strings});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startQuestionId = json['start_question_id'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
    strings =
        json['strings'] != null ?  Strings.fromJson(json['strings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['start_question_id'] = this.startQuestionId;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    if (this.strings != null) {
      data['strings'] = this.strings!.toJson();
    }
    return data;
  }
}

class Questions {
  String? id;
  String? questionType;
  String? answerType;
  String? questionText;
  List<Options>? options;
  String? next;

  Questions(
      {this.id,
      this.questionType,
      this.answerType,
      this.questionText,
      this.options,
      this.next});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionType = json['question_type'];
    answerType = json['answer_type'];
    questionText = json['question_text'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add( Options.fromJson(v));
      });
    }
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['question_type'] = this.questionType;
    data['answer_type'] = this.answerType;
    data['question_text'] = this.questionText;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['next'] = this.next;
    return data;
  }
}

class Options {
  String? value;
  String? displayText;

  Options({this.value, this.displayText});

  Options.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    displayText = json['display_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['value'] = this.value;
    data['display_text'] = this.displayText;
    return data;
  }
}

class Strings {
  En? en;

  Strings({this.en});

  Strings.fromJson(Map<String, dynamic> json) {
    en = json['en'] != null ? new En.fromJson(json['en']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.en != null) {
      data['en'] = this.en!.toJson();
    }
    return data;
  }
}

class En {
  String? qFarmerName;
  String? qFarmerGender;
  String? optMale;
  String? optFemale;
  String? optOther;
  String? qSizeOfFarm;

  En(
      {this.qFarmerName,
      this.qFarmerGender,
      this.optMale,
      this.optFemale,
      this.optOther,
      this.qSizeOfFarm});

  En.fromJson(Map<String, dynamic> json) {
    qFarmerName = json['q_farmer_name'];
    qFarmerGender = json['q_farmer_gender'];
    optMale = json['opt_male'];
    optFemale = json['opt_female'];
    optOther = json['opt_other'];
    qSizeOfFarm = json['q_size_of_farm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['q_farmer_name'] = this.qFarmerName;
    data['q_farmer_gender'] = this.qFarmerGender;
    data['opt_male'] = this.optMale;
    data['opt_female'] = this.optFemale;
    data['opt_other'] = this.optOther;
    data['q_size_of_farm'] = this.qSizeOfFarm;
    return data;
  }
}