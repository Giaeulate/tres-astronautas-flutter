String calculateAge(DateTime? age) {
  if (age != null) {
    DateTime actualDate = DateTime.now();
    int years = actualDate.year - age.year;
    final months = actualDate.month - age.month;
    final days = actualDate.day - age.day;
    if (months <= 0) {
      if (months == 0) {
        if (days <= 0) {
          years -= 1;
        }
      } else {
        years -= 1;
      }
    }
    return "$years";
  }
  return "Sin información";
}
