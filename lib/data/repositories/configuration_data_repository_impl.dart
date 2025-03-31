import 'package:centaur_scores_2/data/repositories/configuration_data_repository.dart';
import 'package:centaur_scores_2/data/servicemodel/device_configuration_data.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationDataRepositoryImpl extends ConfigurationDataRepository {
  final BehaviorSubject<DeviceConfigurationData> dataStreamSubject;

  @override
  Stream<DeviceConfigurationData> get dataStream => dataStreamSubject;

  // Private constructor
  ConfigurationDataRepositoryImpl._create({required this.dataStreamSubject});

  // Public factory constructor
  static Future<ConfigurationDataRepositoryImpl> create() async {
    DeviceConfigurationData data = await _load();
    final result = ConfigurationDataRepositoryImpl._create(
      dataStreamSubject: BehaviorSubject<DeviceConfigurationData>.seeded(data),
    );
    return result;
  }

  @override
  Future applyUpdate(
    bool Function(DeviceConfigurationData) updateAction,
  ) async {
    if (updateAction(dataStreamSubject.value)) {
      await _save(dataStreamSubject.value);
    }
  }

  static Future<void> _save(DeviceConfigurationData data) async {
    final prefs = await SharedPreferences.getInstance();
    if (null == data.serverUri) {
      await prefs.remove("serverUri");
    } else {
      await prefs.setString("serverUri", data.serverUri ?? "");
    }
    if (null == data.serverSecret) {
      await prefs.remove("serverSecret");
    } else {
      prefs.setString("serverSecret", data.serverSecret ?? "");
    }
    if (null == data.deviceID) {
      await prefs.remove("deviceID");
    } else {
      prefs.setString("deviceID", data.deviceID ?? "");
    }
    if (null == data.alwaysUseActiveMatch) {
      await prefs.remove("alwaysUseActiveMatch");
    } else {
      prefs.setBool("alwaysUseActiveMatch", data.alwaysUseActiveMatch ?? true);
    }
    if (null == data.activeMatchID) {
      await prefs.remove("activeMatchID");
    } else {
      prefs.setInt("activeMatchID", data.activeMatchID ?? -1);
    }
  }

  static Future<DeviceConfigurationData> _load() async {
    final prefs = await SharedPreferences.getInstance();

    var result = DeviceConfigurationData();
    result.serverUri = prefs.getString("serverUri");
    result.serverSecret = prefs.getString("serverSecret");
    result.deviceID = prefs.getString("deviceID");
    result.alwaysUseActiveMatch = prefs.getBool("alwaysUseActiveMatch");
    result.activeMatchID = prefs.getInt("activeMatchID");
    return result;
  }
}
