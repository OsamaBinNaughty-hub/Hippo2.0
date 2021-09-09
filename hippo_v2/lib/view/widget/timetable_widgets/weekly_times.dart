class WeeklyTimes {
  static final supportedLocales = const ['en'];

  static final dates = {
  'en': <String>['', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
  };

  static final times = {
    'en': <String>[
      '',
      '07:00',
      '08:00',
      '09:00',
      '10:00',
      '11:00',
      '12:00',
      '13:00',
      '14:00',
      '15:00',
      '16:00',
      '17:00',
      '18:00',
      '19:00',
      '20:00',
      '21:00',
      '22:00',
    ],
  };

  static bool localContains(String locale) => supportedLocales.contains(locale);

}