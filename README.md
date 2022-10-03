# flutterimagevideopicker

A Flutter plugin for iOS and Android for picking images & video from the image & video Library

## Installation

First, add photo_gallery as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

#### iOS

Add the following keys to your _Info.plist_ file, located in `<project root>/ios/Runner/Info.plist`:

`NSPhotoLibraryUsageDescription` - describe why your app needs permission for the photo library. This is called _Privacy - Photo Library Usage Description_ in the visual editor.

```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>Example usage description</string>
```

#### Android

Add the following permissions to your _AndroidManifest.xml_, located in `<project root>/android/app/src/main/AndroidManifest.xml`:

```xml
<manifest ...>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
    ...
<manifest/>
```

API 29+

Add the following property to your _AndroidManifest.xml_, located in `<project root>/android/app/src/main/AndroidManifest.xml` to [opt-out of scoped storage](https://developer.android.com/training/data-storage/use-cases#opt-out-scoped-storage):

```xml
<manifest ...>
    ...
    <application
        android:requestLegacyExternalStorage="true"
        ...>
    <application/>
<manifest/>
```

## Usage

- Listing albums in the gallery

```dart
import 'package:flutter/material.dart';
import 'package:flutterimagevideopicker/flutterimagevideopicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: FlutterImageVideoPicker(
            title: "Gallery",
            onTap: (value) {
              print("value is $value");
            }),
      ),
    );
  }
}
```

- src\screens\Gallery.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutterimagevideopicker/utils/flutterimagevideopicker.dart';

class Gallery extends StatelessWidget {
  const Gallery(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: FlutterImageVideoPicker(
            title: "Gallery",
            onTap: (value) {
              Future.delayed(const Duration(milliseconds: 500), () {
                if (value != null) {
                  Navigator.pop(context, value);
                }
              });
            }));
  }
}


```
