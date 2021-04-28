import 'package:yasambeklentisi/user_data.dart';

class Hesap{
  UserData _userData;
  Hesap(this._userData);

  double hesaplama(){
    double sonuc;
    sonuc=70 + _userData.fitnessDay - _userData.smokeValue;
    sonuc=sonuc+ (_userData.boy/_userData.kilo);
    if(_userData.seciliCinsiyet=='KADIN')
      {
        return sonuc+3;
      }
    else{
      return sonuc;
    }

  }
}