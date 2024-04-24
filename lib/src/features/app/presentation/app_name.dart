import 'package:flutter/material.dart';
import 'package:health_monitoring/src/core/model/dependencies_storage.dart';
import 'package:health_monitoring/src/core/model/repository_storage.dart';
import 'package:health_monitoring/src/core/widget/dependencies_scope.dart';
import 'package:health_monitoring/src/core/widget/repository_scope.dart';
import 'package:health_monitoring/src/features/app/presentation/app_configuration.dart';
import 'package:health_monitoring/src/features/settings/widget/scope/settings_scope.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HealthMonitoring extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  final PackageInfo packageInfo;
  const HealthMonitoring({
    super.key,
    required this.sharedPreferences,
    required this.packageInfo,
  });

  @override
  Widget build(BuildContext context) => DependenciesScope(
        create: (context) => DependenciesStorage(
          databaseName: 'health_monitoring_database',
          sharedPreferences: sharedPreferences,
          packageInfo: packageInfo,
        ),
        child: RepositoryScope(
          create: (context) => RepositoryStorage(
            appDatabase: DependenciesScope.of(context).database,
            sharedPreferences: sharedPreferences,
            networkExecuter: DependenciesScope.of(context).networkExecuter,
          ),
          child: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaleFactor: 1), // Adjust the factor as needed
            child: const SettingsScope(child: AppConfiguration()),
          ),
        ),
      );
}
