void main() {
  print(
    '3. Create a map representing a student grades and calculate the average',
  );
  Map<String, double> studentGrades = {
    'Ahyeon': 85,
    'Ruka': 78.5,
    'Rami': 92,
    'Pharita': 88.5,
    'Rora': 75,
  };

  double total = 0;

  for (var entry in studentGrades.entries) {
    print('${entry.key} mendapat nilai ${entry.value}');
    total += entry.value;
  }

  double avg = total / studentGrades.length;

  print('Rata-rata nilai siswa: ${avg.toStringAsFixed(2)}');
}