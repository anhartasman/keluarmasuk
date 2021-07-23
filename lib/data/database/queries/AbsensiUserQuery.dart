class AbsensiUserQuery {
  static const String TABLE_NAME = "AbsensiUser";
  static const String CREATE_TABLE =
      " CREATE TABLE IF NOT EXISTS $TABLE_NAME ( id INTEGER PRIMARY KEY AUTOINCREMENT, userId TEXT, absenIn INTEGER, absenOut INTEGER, sedangIn INTEGER ) ";
  static const String SELECT = "select * from $TABLE_NAME";
}