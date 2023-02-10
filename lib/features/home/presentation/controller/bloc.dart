import 'dart:math';
import 'package:besmkallahom/core/di/injection.dart';
import 'package:besmkallahom/core/network/local/cache_helper.dart';
import 'package:besmkallahom/features/home/presentation/controller/state.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/azkar/azkar_screen.dart';
import '../screens/donitation/donition_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/quran/quran_screen.dart';


class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(Empty());

  static HomeCubit get(context) => BlocProvider.of(context);


int initialTabIndex = 0;
List<Widget> homeWidgets =
[
  const HomeScreen(),
  const QuranScreen(),
  const AzkarScreen(),
  const SadakaScreen(),
];
void changeNavBottomScreen(int index) {
initialTabIndex = index;
emit(ChangeBottomNavBarState());
}

List<String> randomHomeSlah =
[
  '«إِنَّ اللَّهَ وَمَلَائِكَتَهُ يُصَلُّونَ عَلَى النَّبِيِّ ۚ يَا أَيُّهَا الَّذِينَ آمَنُوا صَلُّوا عَلَيْهِ وَسَلِّمُوا تَسْلِيمًا»،( سورة الأحزاب: الآية 56).',
  'اللهم صلّ على محمد وعلى آل محمد، كما صليت على إبراهيم وعلى آل إبراهيم، وبارك على محمد وعلى آل محمد، كما باركت على إبراهيم وعلى آل إبراهيم، إنك حميد مجيد',
  '«اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّد في الأَوَّلِينَ وَالآخِرِينَ، وَفِي الْمَلأِ الأَعْلَى إِلَى يَوْمِ الْدِّينِ. اللهم صل وسلم وبارك على سيدنا محمد وعلى آله وصحبه عدد ما في علم الله، صلاةً دائمة بدوام ملك الله».',
  '«اللهم صل وسلم وبارك على سيدنا محمد وعلى آله وصحبه عدد كمال الله وكما يليق بكماله».',
  '«اللهم صل وسلم وبارك على سيدنا محمد وعلى آله عدد حروف القرآن حرفًا حرفًا، وعدد كل حرف ألفًا ألفًا، وعدد صفوف الملائكة صفًا صفًا، وعدد كل صف ألفًا ألفًا، وعدد الرمال ذرة ذرة، وعدد ما أحاط به علمك، وجرى به قلمك، ونفذ به حكمك في برك وبحرك، وسائر خلقك».',
  '-«اللهم صلِّ وسلم على صاحب الخُلق العظيم والقدر الفخيم مَن أرسلته رحمة للعالمين سيدنا محمد وعلى آله وصحبه، وألحقنا بخُلقه وأدّبنا بأدبه، وأحيي فينا وفي أُمته هذه المعاني يا كريم».',
  '«اللهم صَلِّ وسلم على سيدنا محمد صلاة تحل بها عقدتي، وتفرج بها كربتي، وتمحو بها خطيئتي، وتقضي بها حاجتي».',
  '- «اللهم صل وسلم على سيدنا محمد صلاة تهب لنا بها أكمل المراد وفوق المراد، في دار الدنيا ودار المعاد، وعلى آله وصحبه وبارك وسلم عدد ما علمت وزنة ماعلمت وملء ما علمت».',
  '«اللهم صل على سيدنا محمد صلاة تنجينا بها من جميع الأهوال والآفات، وتقضي بها جميع الحاجات، وتطهرنا بها من جميع السيئات، وترفعنا بها عندك أعلى الدرجات، وتبلغنا بها أقصى الغايات من جميع الخيرات في الحياة وبعد الممات، وعلى آله وصحبه وسلم تسليمًا كثيرًا »',
  '«اللهم صل وسلم على سيدنا محمد وعلى آله، صلاة تكون لنا طريقًا لقربه، وتأكيدًا لحبه، وبابًا لجمعنا عليه، وهدية مقبولة بين يديه، وسلم وبارك كذلك أبدًا، وارض عن آله وصحبه السعداء، واكسنا حُلل الرضا».'
];

String? pickedRandom;
void pickRandomHomeSlah()
  {
    pickedRandom = randomHomeSlah[Random().nextInt(randomHomeSlah.length)];
    Future.delayed(const Duration(seconds: 20) , pickRandomHomeSlah);
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: ' ',
        text: ' ',
        linkUrl: 'https://play.google.com/store/apps/details?id=com.mohammed.gallya.Nakhtm_Quran',
        chooserTitle: 'شارك بواسطة'
    );
  }

  bool hideCardValue = false;
  void hideCard()
  {
    hideCardValue = !hideCardValue;
    emit(HideCardValueState());
  }

  bool ayahPressedValue = false;
  void ayahPressed(bool value)
  {
    ayahPressedValue = value;
    emit(AyahOnPressedValueState());
  }

  int currentTasbeehNumber = 0;
  void changeCurrentTasbeehNumber(){
    currentTasbeehNumber++;
    emit(ChangeCurrentTasbeehNumber());
  }

  int totalTasbeeh = 0 ;
  void saveTotalTasbeeh() async{
    totalTasbeeh = totalTasbeeh + currentTasbeehNumber;
    currentTasbeehNumber = 0;
    await sl<CacheHelper>().put('totalTasbeeh',totalTasbeeh);
    getTotalTasbeeh();
  }

  void getTotalTasbeeh()async{
    totalTasbeeh = await sl<CacheHelper>().get('totalTasbeeh');
    emit(GetTotalTasbeeh());
  }

  List<int> repetitionNum = [3,2,4,3,4,3,4,3,4,3];
  void changeRepetitionNum(int index){
    repetitionNum[index]--;
    emit(ChangeRepetitionNumber());
  }

  bool azkarPressedValue = false;
  void azkarPressed()
  {
    ayahPressedValue = true;
    emit(AyahOnPressedValueState());
  }

}
