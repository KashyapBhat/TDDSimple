# String Calculator – TDD Kata (Dart)

This project is an implementation of the classic **String Calculator Kata** using the **Test-Driven Development (TDD)** approach in Dart.

## Problem Statement

add(String? numbers) function That takes a string of numbers separated by delimiters and returns their sum, following a set of incremental rules and constraints.

- Features Implemented
- Returns 0 for empty or null string
- Handles one or more comma-separated numbers
- Supports newline (\n) as delimiter
- Supports custom delimiters via prefix syntax: //[delimiter]\n[numbers]
- Throws NegativeNumberException if any negative numbers are found, listing all negatives
- Ignores numbers greater than 1000
- Supports multi-character custom delimiters like //[***]\n1***2***3

## Project Structure
lib/
  └── string_calculator.dart  
  └── exception/
       └── negative_number_exception.dart  
test/
  └── string_calculator_test.dart 
pubspec.yaml
README.md

Link: https://osherove.com/tdd-kata-1