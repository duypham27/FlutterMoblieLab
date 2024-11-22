
/**
 * Bài tập ex07:
 * Viết chương trình tính tổng các ước số của một số nguyên được nhập từ bàn phím (n >= 1)
 */

import 'dart:io';

void main()
{
  // Khai báo biến số nguyên n
  int n = 0;

  //Kiểm tra
  do {
    stdout.write('Nhập n (n >= 1): ');
    String? inputN = stdin.readLineSync();

    // Điều kiện
    if (inputN != null) {
      n = int.tryParse(inputN) ?? 0;
    }
    if (n == 0) {
      print("Vui lòng nhập lại: ");
    }
  } while (n < 1);

  // Khai báo biến tổng
  int sumN = 0;

  // Vòng lặp để đếm các ước số của n 
  for(int i = 1; i <= n; i++)
  {
    // Điều kiện để tính các ước số
    if(n % i == 0)
    {
      sumN += i;
    }
  }
  // In ra màn hình
  print('Tổng các ước số của $n là: $sumN');

}