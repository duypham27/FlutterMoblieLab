
void main()
{
  // var ten = 'Tung';

  // String name;
  // name = 'Cuong';

  // final String x;
  // x = 'Value';
  // //x ='Value1';

  // const int nam = 2004;

  // late String moTa;
  // moTa = 'Gioi thieu mon hoc';

  // print('Mo ta: $moTa');
  // print('Nam: $nam');

  Object obj = 'Hello';

  if (obj is String)
  {
    print('obj la String');
  }

  // Kiem tra khong phai kieu int
  if(obj is! int)
  {
    print('obj khong phai la int');
  }

  // Ep kieu
  String str = obj as String;
  print(str.toUpperCase());

  // ??=

  // ~/= : chia lấy nguyên (vd:%)




}