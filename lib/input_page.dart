import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasambeklentisi/result_page.dart';
import 'package:yasambeklentisi/user_data.dart';
import 'MyColumn.dart';
import 'MyContainer.dart';
import 'constants.dart';
import 'user_data.dart';
class InputPage extends StatefulWidget {
  static const String routeName ='/';
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet;
  double smokeValue=0.0;
  double fitnessDay=0.0;
  int boy = 170;
  int kilo = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlinedButton('BOY',boy),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlinedButton('KİLO',kilo),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: [
                  Text(
                    'Haftada Kaç Gün Spor Yapıyorsun ? ',
                    style: kMetinStili,
                  ),
                  Text(
                    smokeValue.round().toString(),
                    //'${SmokeValue.round()}',
                    style: kSayiStili,
                  ),
                  Slider.adaptive(
                    min: 0,
                    max: 7,
                    divisions: 7,
                    value: smokeValue,
                    onChanged: (newValue){
                    setState(() {
                      smokeValue=newValue;
                    });
                  },),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: [
                  Text(
                    'Günde Kaç Kez Sigara İçiyorsun ? ',
                    style: kMetinStili,
                  ),
                  Text(
                    fitnessDay.round().toString(),
                    //'${SmokeValue.round()}',
                    style: kSayiStili,
                  ),
                  Slider.adaptive(
                    min: 0,
                    max: 30,
                    divisions: 30,
                    value: fitnessDay,
                    //label: FitnessDay.toString(),
                    onChanged: (newValue){
                      setState(() {
                        fitnessDay=newValue;
                      });
                    },),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.pinkAccent
                        : Colors.white,
                    child: MyColumn(
                      sex: 'KADIN',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.blueAccent
                        : Colors.white,
                    child: MyColumn(sex: 'ERKEK', icon: FontAwesomeIcons.mars),
                  ),
                ),
              ],
            ),
          ),
          MyContainer(child: TextButton(style: TextButton.styleFrom(backgroundColor: Colors.white),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(
              UserData(seciliCinsiyet: seciliCinsiyet,boy: boy,kilo: kilo,smokeValue: smokeValue,fitnessDay: fitnessDay)
            )));
          }, child: Text('HESAPLA',style: kMetinStili,)))
        ],
      ),
    );
  }

  Row buildRowOutlinedButton(String val1,int val2) {
    return Row(children: [
                    SizedBox(width: 5,),
                    RotatedBox(
                      quarterTurns:-1,
                      child: Text(val1,style: kMetinStili,),),
                    RotatedBox(
                      quarterTurns:-1,
                      child: Text(val2.toString(),style: kSayiStili,),),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        decoration: BoxDecoration(border: Border.all(color:Colors.blue),),
                        child: ButtonTheme(
                          minWidth: 40,
                          child: OutlinedButton(onPressed: (){
                            setState(() {
                              val1 == 'BOY' ? boy++ : kilo++;
                            });
                          },
                            child: Icon(FontAwesomeIcons.plus,size: 17, color: Colors.black54,),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        decoration: BoxDecoration(border: Border.all(color:Colors.blue),),
                        child: ButtonTheme(
                          minWidth: 40,
                          child: OutlinedButton(onPressed: (){
                            setState(() {
                              val1 == 'BOY' ? boy-- : kilo--;
                            });
                          },
                            child: Icon(FontAwesomeIcons.minus,size: 17, color: Colors.black54,),
                          ),
                        ),
                      ),
                    ],),
                  ],);
  }
}

