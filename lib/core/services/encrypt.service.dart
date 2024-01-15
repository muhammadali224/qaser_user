import 'package:encrypt/encrypt.dart';

class EncryptData {
  static final String _key = "Muhammad Ali Al-Qaser Al-sharqi.";

  static String decryptWithAES(Encrypted encryptedData) {
    final cipherKey = Key.fromUtf8(_key);
    final encryptService = Encrypter(AES(cipherKey, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(_key.substring(0, 16));
    return encryptService.decrypt(encryptedData, iv: initVector);
  }

  static Encrypted encryptWithAES(String plainText) {
    final cipherKey = Key.fromUtf8(_key);
    final encryptService = Encrypter(AES(cipherKey, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(_key.substring(0, 16));
    Encrypted encryptedData = encryptService.encrypt(plainText, iv: initVector);
    return encryptedData;
  }

  static String decryptText(String encryptedText) {
    final key = Key.fromUtf8(_key);
    final initVector = IV.fromUtf8(_key.substring(0, 16));
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt64(encryptedText, iv: initVector);
    return decrypted;
  }
}
