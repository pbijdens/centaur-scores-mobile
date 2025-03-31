import 'dart:async';

import 'package:centaur_scores_2/data/repositories/configuration_data_repository.dart';
import 'package:centaur_scores_2/data/servicemodel/device_configuration_data.dart';
import 'package:centaur_scores_2/data/servicemodel/match_basic_data.dart';
import 'package:centaur_scores_2/viewmodels/setup/setup_screen_state.dart';
import 'package:centaur_scores_2/viewmodels/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class SetupViewModel extends ViewModel {
  final _dataStateSubject = BehaviorSubject<SetupScreenState>.seeded(
    SetupScreenState.empty(),
  );
  Stream<SetupScreenState> get state => _dataStateSubject;

  ConfigurationDataRepository configurationDataRepository;
  StreamSubscription<DeviceConfigurationData>?
  _configurationDataRepositorySubscription;

  SetupViewModel({required this.configurationDataRepository});

  @override
  void dispose() {
    _dataStateSubject.close();

    unregisterFromRepositoryUpdates();
  }

  @override
  void init() {
    super.init();
    registerForRepositoryUpdates();
  }

  void onTapInitializeFromQrCode() {
    if (!_dataStateSubject.value.isQrScannerActive) {
      _dataStateSubject.add(
        _dataStateSubject.value.copyWith(isQrScannerActive: true),
      );
    }
  }

  void onChangeServerUri(String serverUri) {
    if (_dataStateSubject.value.serverUri != serverUri) {
      _dataStateSubject.add(
        _dataStateSubject.value.copyWith(serverUri: serverUri),
      );
    }
  }

  void onChangeServerSecret(String serverSecret) {
    if (_dataStateSubject.value.serverSecret != serverSecret) {
      _dataStateSubject.add(
        _dataStateSubject.value.copyWith(serverSecret: serverSecret),
      );
    }
  }

  void onChangeAlwaysUseActiveMatch(bool alwaysUseActiveMatch) {
    if (_dataStateSubject.value.alwaysUseActiveMatch != alwaysUseActiveMatch) {
      _dataStateSubject.add(
        _dataStateSubject.value.copyWith(
          alwaysUseActiveMatch: alwaysUseActiveMatch,
        ),
      );
    }
  }

  void onChangeSelectedMatch(MatchBasicData? selectedMatch) {
    if (_dataStateSubject.value.selectedMatch != selectedMatch) {
      _dataStateSubject.add(
        _dataStateSubject.value.copyWith(selectedMatch: selectedMatch),
      );
    }
  }

  void onChangeDeviceID(String deviceID) {
    if (_dataStateSubject.value.deviceID != deviceID) {
      _dataStateSubject.add(
        _dataStateSubject.value.copyWith(deviceID: deviceID),
      );
    }
  }

  void unregisterFromRepositoryUpdates() {
    _configurationDataRepositorySubscription?.cancel();
    _configurationDataRepositorySubscription = null;
  }

  void registerForRepositoryUpdates() {
    _configurationDataRepositorySubscription = configurationDataRepository
        .dataStream
        .listen(
          (data) => _dataStateSubject.add(
            _dataStateSubject.value.copyWith(
              alwaysUseActiveMatch: data.alwaysUseActiveMatch,
              deviceID: data.deviceID,
              selectedMatch: null,
              serverSecret: data.serverSecret,
              serverUri: data.serverUri,
            ),
          ),
        );
  }
}
