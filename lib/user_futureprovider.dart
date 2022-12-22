// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class FutureUser {
  final String name;
  final String email;

  FutureUser(
    this.name,
    this.email,
  );

  FutureUser copyWith({
    String? name,
    String? email,
  }) {
    return FutureUser(
      name ?? this.name,
      email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory FutureUser.fromMap(Map<String, dynamic> map) {
    return FutureUser(
      map['name'] as String,
      map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FutureUser.fromJson(String source) =>
      FutureUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FutureUser(name: $name, email: $email)';

  @override
  bool operator ==(covariant FutureUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

final futureUserRepoProvider = Provider((ref) => FutureUserRepo());

class FutureUserRepo {
  Future<FutureUser> fetchUserData() {
    const url = "https://jsonplaceholder.typicode.com/users/1";
    return http
        .get(Uri.parse(url))
        .then((value) => FutureUser.fromJson(value.body));
  }
}
