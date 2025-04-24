void main() {
  print('1. Create a function that calculates the area of a rectangle');
  int panjang = 10;
  int lebar = 5;

  int luas = hitungLuas(panjang, lebar);
  int keliling = hitungKeliling(panjang, lebar);

  print('Luas: $luas');
  print('Keliling: $keliling');
}

int hitungLuas(int panjang, int lebar) {
  return panjang * lebar;
}

int hitungKeliling(int panjang, int lebar) {
  return 2 * (panjang + lebar);
}
