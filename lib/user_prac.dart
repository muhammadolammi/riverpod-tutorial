// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Info {
  final String title;
  final String data;

  Info({
    required this.title,
    required this.data,
  });

  Info copyWith({
    String? title,
    String? data,
  }) {
    return Info(
      title: title ?? this.title,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'data': data,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      title: map['title'] as String,
      data: map['data'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Info.fromJson(String source) =>
      Info.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Info(title: $title, data: $data)';

  @override
  bool operator ==(covariant Info other) {
    if (identical(this, other)) return true;

    return other.title == title && other.data == data;
  }

  @override
  int get hashCode => title.hashCode ^ data.hashCode;
}

class InfoNotifier extends StateNotifier<Info> {
  InfoNotifier() : super(Info(title: "", data: "")) {
    updateData("Input Your Info To Update The Interface");
  }
  void updateTitle(String t) {
    state = state.copyWith(
      title: t,
    );
  }

  void updateData(String d) {
    state = state.copyWith(
      data: "Welcome Dev. " + d,
    );
  }
}
