import 'package:centaur_scores_2/data/servicemodel/device_configuration_data.dart';

abstract class ConfigurationDataRepository {
  // Stream that is updated whenever a new version of the repository is
  // made available through whatever persistence backend is used for this
  // data
  Stream<DeviceConfigurationData> get dataStream;

  // Requests an update to be applied to the model object; is provided in the
  // form of a funcmtion to allow for synchronization: the update can be
  // queued until the action can be applied without the repository having to
  // worry about the change being applied
  //
  // The updateAction miust return true if and only if the update action
  // actually changed the object (i.e. the updater must check if the update
  // changes the object)
  Future applyUpdate(bool Function(DeviceConfigurationData) updateAction);
}
