import 'package:health_monitoring/src/features/app/logic/main_runner.dart';
import 'package:health_monitoring/src/features/app/model/async_app_dependencies.dart';
import 'package:health_monitoring/src/features/app/presentation/app_name.dart';

Future<void> main() => MainRunner.run<AsyncAppDependencies>(
      asyncDependencies: AsyncAppDependencies.obtain,
      appBuilder: (dependencies) => HealthMonitoring(
        sharedPreferences: dependencies.sharedPreferences,
        packageInfo: dependencies.packageInfo,
      ),
    );

// void main() {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//   // SystemChrome.setSystemUIOverlayStyle(
//   //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//   // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
//   // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//   //     .then((_) {

//   // });
// }
