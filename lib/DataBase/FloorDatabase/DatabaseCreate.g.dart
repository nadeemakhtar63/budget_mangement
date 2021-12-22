// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DatabaseCreate.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $Floordatabaseexp {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$databaseexpBuilder databaseBuilder(String name) =>
      _$databaseexpBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$databaseexpBuilder inMemoryDatabaseBuilder() =>
      _$databaseexpBuilder(null);
}

class _$databaseexpBuilder {
  _$databaseexpBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$databaseexpBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$databaseexpBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<databaseexp> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$databaseexp();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$databaseexp extends databaseexp {
  _$databaseexp([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  budgetDao _expdioInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `exp` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `amount` INTEGER, `ref` TEXT, `dateexp` TEXT, `discr` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `income` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `amount` INTEGER, `ref` TEXT, `dateexp` TEXT, `discr` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  budgetDao get expdio {
    return _expdioInstance ??= _$budgetDao(database, changeListener);
  }
}

class _$budgetDao extends budgetDao {
  _$budgetDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _incomEntityInsertionAdapter = InsertionAdapter(
            database,
            'income',
            (IncomEntity item) => <String, dynamic>{
                  'id': item.id,
                  'amount': item.amount,
                  'ref': item.ref,
                  'dateexp': item.dateexp,
                  'discr': item.discr
                }),
        _expEntityInsertionAdapter = InsertionAdapter(
            database,
            'exp',
            (ExpEntity item) => <String, dynamic>{
                  'id': item.id,
                  'amount': item.amount,
                  'ref': item.ref,
                  'dateexp': item.dateexp,
                  'discr': item.discr
                },
            changeListener),
        _incomEntityDeletionAdapter = DeletionAdapter(
            database,
            'income',
            ['id'],
            (IncomEntity item) => <String, dynamic>{
                  'id': item.id,
                  'amount': item.amount,
                  'ref': item.ref,
                  'dateexp': item.dateexp,
                  'discr': item.discr
                }),
        _expEntityDeletionAdapter = DeletionAdapter(
            database,
            'exp',
            ['id'],
            (ExpEntity item) => <String, dynamic>{
                  'id': item.id,
                  'amount': item.amount,
                  'ref': item.ref,
                  'dateexp': item.dateexp,
                  'discr': item.discr
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<IncomEntity> _incomEntityInsertionAdapter;

  final InsertionAdapter<ExpEntity> _expEntityInsertionAdapter;

  final DeletionAdapter<IncomEntity> _incomEntityDeletionAdapter;

  final DeletionAdapter<ExpEntity> _expEntityDeletionAdapter;

  @override
  Future<List<IncomEntity>> incomePrevsMonths(String choosedate) async {
    return _queryAdapter.queryList('select * from income where dateexp Like ?',
        arguments: <dynamic>[choosedate],
        mapper: (Map<String, dynamic> row) => IncomEntity(
            id: row['id'] as int,
            amount: row['amount'] as int,
            ref: row['ref'] as String,
            dateexp: row['dateexp'] as String,
            discr: row['discr'] as String));
  }

  @override
  Future<List<ExpEntity>> expgetonDate() async {
    return _queryAdapter.queryList('SELECT * FROM exp',
        mapper: (Map<String, dynamic> row) => ExpEntity(
            id: row['id'] as int,
            amount: row['amount'] as int,
            ref: row['ref'] as String,
            dateexp: row['dateexp'] as String,
            discr: row['discr'] as String));
  }

  @override
  Future<List<ExpEntity>> selectMonth(int id) async {
    return _queryAdapter.queryList('select * from exp where dateexp =?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => ExpEntity(
            id: row['id'] as int,
            amount: row['amount'] as int,
            ref: row['ref'] as String,
            dateexp: row['dateexp'] as String,
            discr: row['discr'] as String));
  }

  @override
  Stream<ExpEntity> deleteidcard(int id) {
    return _queryAdapter.queryStream('Delete from exp where id=?',
        arguments: <dynamic>[id],
        queryableName: 'exp',
        isView: false,
        mapper: (Map<String, dynamic> row) => ExpEntity(
            id: row['id'] as int,
            amount: row['amount'] as int,
            ref: row['ref'] as String,
            dateexp: row['dateexp'] as String,
            discr: row['discr'] as String));
  }

  @override
  Future<List<ExpEntity>> expPrevsMonths(String choosedate) async {
    return _queryAdapter.queryList('select * from exp where dateexp Like ?',
        arguments: <dynamic>[choosedate],
        mapper: (Map<String, dynamic> row) => ExpEntity(
            id: row['id'] as int,
            amount: row['amount'] as int,
            ref: row['ref'] as String,
            dateexp: row['dateexp'] as String,
            discr: row['discr'] as String));
  }

  @override
  Future<List<ExpEntity>> expMoth() async {
    return _queryAdapter.queryList(
        'SELECT * from exp where ADDDATE(dateexp,MONTH(02))',
        mapper: (Map<String, dynamic> row) => ExpEntity(
            id: row['id'] as int,
            amount: row['amount'] as int,
            ref: row['ref'] as String,
            dateexp: row['dateexp'] as String,
            discr: row['discr'] as String));
  }

  @override
  Future<void> insertIncom(IncomEntity incomEntity) async {
    await _incomEntityInsertionAdapter.insert(
        incomEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertExp(ExpEntity expEntity) async {
    await _expEntityInsertionAdapter.insert(
        expEntity, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteIncoms(IncomEntity incomEntity) {
    return _incomEntityDeletionAdapter.deleteAndReturnChangedRows(incomEntity);
  }

  @override
  Future<int> deleteExpense(ExpEntity expentity) {
    return _expEntityDeletionAdapter.deleteAndReturnChangedRows(expentity);
  }
}
