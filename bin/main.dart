import 'package:steel_crypt/steel_crypt.dart';

final passCrypt = PassCrypt('SHA-256/HMAC/PBKDF2');
final salt = CryptKey().genDart(16);

verify(psw1, psw2, hashed) {
  print("[VERIFY] $psw1\t$psw2");
  var isCorrect = hash(psw1) == hashed;
  print("[VERIFY] $isCorrect");
}

hash(psw) {
  print("[HASH] plainPassword: $psw");
  var hashed = passCrypt.hashPass(salt, psw);
  print("[HASH] hashedPassword: $hashed");
  return hashed;
}

main() {
  var psw1 = "pass1234";
  var psw2 = "1234pass";
  var hash1 = hash(psw1);
  var hash2 = hash(psw2);
  verify(psw1, psw2, hash2);
  verify(psw1, psw1, hash1);
}
