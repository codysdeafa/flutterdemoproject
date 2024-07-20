import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/pointycastle.dart';

//RSA加密添加
class RSAEncrypt {
  RSAEncrypt._();
  static const String _privateKeyString = '';
  static const String _publicKeyString =
      'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDYRtYLGopPLbpuLHWu/T2yh6ai+XruDyxBmIPFnCDE6kYoHhOoKKHYar8xb45G/bzjoByLRH0jxAE/ImZcSlqS9DUn8dAS1sl1i6j3Am9GHzPxGUKgTPR7/PULO3xN7O4GiesPRfp1XpESZXwtlfcBPFPHzxhv6VfDS4qeRmxKjQIDAQAB';

  ///加密
  static String encryption(String content) {
    final parser = RSAKeyParser();

    String publicKeyString = '''
-----BEGIN PUBLIC KEY-----
$_publicKeyString
-----END PUBLIC KEY-----
''';
    RSAPublicKey publicKey = parser.parse(publicKeyString) as RSAPublicKey;
    final encrypter = Encrypter(RSA(publicKey: publicKey));
    String encryResult = encrypter.encrypt(content).base64;
    return encryResult;
  }

  /// 解密
  static decrypt(String decoded) {
    final parser = RSAKeyParser();

    String privateKeyString = '''
-----BEGIN RSA PRIVATE KEY-----
$_privateKeyString
-----END RSA PRIVATE KEY-----
''';
    final privateKey = parser.parse(privateKeyString) as RSAPrivateKey;
    final encrypter = Encrypter(RSA(privateKey: privateKey));
    return encrypter.decrypt(Encrypted.fromBase64(decoded));
  }
}
