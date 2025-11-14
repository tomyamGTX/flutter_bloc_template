# 🚀 Flutter BLoC Template

A clean and scalable Flutter project template built with **BLoC (Business Logic Component)** architecture.
This template helps developers quickly bootstrap new Flutter apps with state management, theming, and authentication structure already integrated.

---

## 📚 Table of Contents

* [Overview](#overview)
* [Features](#features)
* [Tech Stack](#tech-stack)
* [Project Structure](#project-structure)
* [Roadmap](#roadmap)

---

## 🧭 Overview

This template provides a solid foundation for building Flutter applications following clean architecture principles.
It includes:

* `flutter_bloc` for state management
* Light/Dark theme switching with local persistence
* Firebase Authentication structure (AuthRepository, AuthCubit, AuthGate)
* Counter demo as an example feature

The goal is to speed up development by giving you a ready-to-use, scalable project layout.

---

## ✨ Features

### 🧩 Core Functionality

* **State Management using `flutter_bloc`**
* **Clean Cubit architecture**
* **Modular project folder structure**

### 🌙 Theming

* **Light & Dark mode toggle**
* **Theme persistence using SharedPreferences**

### 🔐 Authentication (Initial Setup)

* Firebase Authentication integration structure
* `AuthRepository` for auth logic
* `AuthCubit` for user session state
* `AuthGate` to route users based on login state

### 🔢 Demo Feature

* **Counter example** (simple BLoC usage)

### 🧱 Easy to Extend

* Add new features, screens, and modules easily
* Organized by clean, scalable feature-first layout

---

## 🛠 Tech Stack

* **Framework:** Flutter 3.x
* **State Management:** flutter_bloc
* **Auth:** Firebase Authentication
* **Local Storage:** SharedPreferences
* **Language:** Dart

---

## 📁 Project Structure

```
lib/
 ┣ core/
 ┃   ┗ auth_gate.dart
 ┃
 ┣ features/
 ┃   ┣ counter/
 ┃   ┃   ┣ cubit/counter_cubit.dart
 ┃   ┃   ┗ pages/counter_page.dart
 ┃   ┣ theme/
 ┃   ┃   ┗ cubit/theme_cubit.dart
 ┃   ┗ auth/
 ┃       ┣ data/auth_repository.dart
 ┃       ┣ cubit/auth_cubit.dart
 ┃       ┣ models/app_user.dart
 ┃       ┗ pages/sign_in_page.dart
 ┃
 ┣ main.dart
```

---

## 🧭 Roadmap

Planned upcoming features:

* 🔐 Complete Firebase authentication UI
* 👤 Profile page with BLoC
* 🗂 Example API integration using Repository pattern
* 🌐 Routing cleanup (GoRouter optional)
* 📦 Full local storage service abstraction
