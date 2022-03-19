import 'package:flutter/material.dart';

class Person {
  final String name;

  Person(this.name);
}

class Persons with ChangeNotifier{
  List<Person> persons = [
    Person('Red'),
    Person('Blue'),
    Person('Green'),
    Person('Yellow'),
  ];
}
