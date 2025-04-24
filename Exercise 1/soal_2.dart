void main() {
  print('2. Create a list of names and print each name using a loop');
  final names = <String>['Ahyeon', 'Ruka', 'Rami', 'Pharita', 'Rora'];

  // Loop 1
  for (var nama in names) {
    print(nama);
  }

  // Loop 2
  for (int i = 0; i < names.length; i++) {
    print(names[i]);
  }
}
