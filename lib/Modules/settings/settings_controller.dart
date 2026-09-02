import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool orderNotifications = true;
  bool promoAlerts = true;
  bool soundEffects = true;

  void toggleOrderNotifications(bool val) {
    orderNotifications = val;
    update();
  }

  void togglePromoAlerts(bool val) {
    promoAlerts = val;
    update();
  }

  void toggleSoundEffects(bool val) {
    soundEffects = val;
    update();
  }
}
