// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:package_info_plus/package_info_plus.dart';
//
// class MellotippetFirebaseRemoteConfig {
//   final remoteConfig = FirebaseRemoteConfig.instance;
//
//   static Future<void> initialize() async {
//     final remoteConfig = FirebaseRemoteConfig.instance;
//
//     // Set configuration
//     await remoteConfig.setConfigSettings(
//       RemoteConfigSettings(
//         fetchTimeout: const Duration(minutes: 1),
//         minimumFetchInterval: const Duration(hours: 1),
//       ),
//     );
//
//     // These will be used before the values are fetched from Firebase Remote Config.
//     await remoteConfig.setDefaults(const {
//       'requiredMinimumVersion': '2.0.8',
//       'recommendedMinimumVersion': '2.1.0',
//     });
//
//     // Fetch the values from Firebase Remote Config
//     await remoteConfig.fetchAndActivate();
//
//     // Optional: listen for and activate changes to the Firebase Remote Config values
//     remoteConfig.onConfigUpdated.listen((event) async {
//       await remoteConfig.activate();
//     });
//   }
//
//   // Helper methods to simplify using the values in other parts of the code
//   String getRequiredMinimumVersion() =>
//       remoteConfig.getString('requiredMinimumVersion');
//
//   String getRecommendedMinimumVersion() =>
//       remoteConfig.getString('recommendedMinimumVersion');
// }
//
// class MellotippetPackageInfo {
//   late String version;
//
//   Future<void> initialize() async {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     version = packageInfo.version;
//   }
// }
