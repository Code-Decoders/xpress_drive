import 'dart:convert';

import 'package:biometric_storage/biometric_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class BiometricService {
  Future<bool> storePkey(String username, String pkey) async {
    final response = await BiometricStorage().canAuthenticate();
    const prompt = AndroidPromptInfo(
      title: 'Unlock Biometric Storage',
      confirmationRequired: true,
      description: 'Please authenticate to store pkey in biometric storage',
      negativeButton: 'Cancel',
    );
    if (response != CanAuthenticateResponse.success) {
      return false;
    } else {
      try {
        return await (await BiometricStorage().getStorage(
          'pkey',
          promptInfo: const PromptInfo(androidPromptInfo: prompt),
        ))
            .write(jsonEncode([username, pkey]))
            .then((value) {
          return true;
        }).catchError((e) {
          return false;
        });
      } catch (e) {
        return false;
      }
    }
  }

  Future<List<String?>?> getKey() async {
    var source;
    final response = await BiometricStorage().canAuthenticate();
    if (response != CanAuthenticateResponse.success) {
      // panic..
      return null;
    } else {
      source = await (await BiometricStorage().getStorage(
        'pkey',
        promptInfo: const PromptInfo(
          androidPromptInfo: AndroidPromptInfo(
            title: 'Unlock Biometric Storage',
            confirmationRequired: true,
            description:
                'Please authenticate to acess pkey from biometric storage',
            negativeButton: 'Cancel',
          ),
        ),
      ))
          .read()
          .catchError((e) {
        return null;
      });
      return jsonDecode(source);
    }
  }
}
