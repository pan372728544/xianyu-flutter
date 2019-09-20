
class CommandModel {
  List<Titles> titles;

  CommandModel({this.titles});

  CommandModel.fromJson(Map<String, dynamic> json) {
    if (json['titles'] != null) {
      titles = new List<Titles>();
      json['titles'].forEach((v) {
        titles.add(new Titles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.titles != null) {
      data['titles'] = this.titles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Titles {
  String title;
  String titleId;

  Titles({this.title, this.titleId});

  Titles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleId = json['titleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['titleId'] = this.titleId;
    return data;
  }
}