

import 'dart:convert';

Stories storiesFromJson(String str) => Stories.fromJson(json.decode(str));


class Stories {
    Stories({
        required this.version,
        required this.home,
    });

    String version;
    Home home;

    factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        version: json["version"],
        home: Home.fromJson(json["home"]),
    );

   
}

class Home {
    Home({
        required this.stories,
    });

    List<Story> stories;

    factory Home.fromJson(Map<String, dynamic> json) => Home(
        stories: List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
    );


}

class Story {
    Story({
        required this.id,
        required this.name,
        required this.iconUrl,
        required this.cornerImageUrl,
        required this.borderColor,
        required this.pages,
    });

    String id;
    String name;
    String iconUrl;
    String cornerImageUrl;
    String borderColor;
    List<Page> pages;

    factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        name: json["name"],
        iconUrl: json["iconUrl"],
        cornerImageUrl: json["cornerImageUrl"],
        borderColor: json["borderColor"],
        pages: List<Page>.from(json["pages"].map((x) => Page.fromJson(x))),
    );

}

class Page {
    Page({
        required this.texts,
        required this.topImageUrl,
        required this.bottomImageUrl,
        required this.backgroundColor,
        required this.textColor,
    });

    List<DisplayText> texts;
    String topImageUrl;
    String bottomImageUrl;
    String backgroundColor;
    String textColor;

    factory Page.fromJson(Map<String, dynamic> json) => Page(
        texts: List<DisplayText>.from(json["texts"].map((x) => DisplayText.fromJson(x))),
        topImageUrl: json["topImageUrl"],
        bottomImageUrl: json["bottomImageUrl"],
        backgroundColor: json["backgroundColor"],
        textColor: json["textColor"],
    );

   
}


class DisplayText {
    DisplayText({
        required this.text,
        required this.bold,
    });

    String text;
    String bold;

    factory DisplayText.fromJson(Map<String, dynamic> json) => DisplayText(
        text: json["text"],
        bold: json["bold"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "bold": bold,
    };
}


