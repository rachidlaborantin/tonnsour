// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDayCollection on Isar {
  IsarCollection<Day> get days => this.collection();
}

const DaySchema = CollectionSchema(
  name: r'Day',
  id: 4355558770213572104,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _dayEstimateSize,
  serialize: _daySerialize,
  deserialize: _dayDeserialize,
  deserializeProp: _dayDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'plans': LinkSchema(
      id: -4132346543874704826,
      name: r'plans',
      target: r'Plan',
      single: false,
    ),
    r'goals': LinkSchema(
      id: 1335530641057181520,
      name: r'goals',
      target: r'Goal',
      single: false,
    ),
    r'tasks': LinkSchema(
      id: 1415990548817740107,
      name: r'tasks',
      target: r'Task',
      single: false,
    ),
    r'reminders': LinkSchema(
      id: -4789782900990631544,
      name: r'reminders',
      target: r'Reminder',
      single: false,
    ),
    r'tocalls': LinkSchema(
      id: -8760932695047577509,
      name: r'tocalls',
      target: r'ToCall',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _dayGetId,
  getLinks: _dayGetLinks,
  attach: _dayAttach,
  version: '3.1.0+1',
);

int _dayEstimateSize(
  Day object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _daySerialize(
  Day object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
}

Day _dayDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Day();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  return object;
}

P _dayDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dayGetId(Day object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dayGetLinks(Day object) {
  return [
    object.plans,
    object.goals,
    object.tasks,
    object.reminders,
    object.tocalls
  ];
}

void _dayAttach(IsarCollection<dynamic> col, Id id, Day object) {
  object.id = id;
  object.plans.attach(col, col.isar.collection<Plan>(), r'plans', id);
  object.goals.attach(col, col.isar.collection<Goal>(), r'goals', id);
  object.tasks.attach(col, col.isar.collection<Task>(), r'tasks', id);
  object.reminders
      .attach(col, col.isar.collection<Reminder>(), r'reminders', id);
  object.tocalls.attach(col, col.isar.collection<ToCall>(), r'tocalls', id);
}

extension DayByIndex on IsarCollection<Day> {
  Future<Day?> getByDate(DateTime date) {
    return getByIndex(r'date', [date]);
  }

  Day? getByDateSync(DateTime date) {
    return getByIndexSync(r'date', [date]);
  }

  Future<bool> deleteByDate(DateTime date) {
    return deleteByIndex(r'date', [date]);
  }

  bool deleteByDateSync(DateTime date) {
    return deleteByIndexSync(r'date', [date]);
  }

  Future<List<Day?>> getAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex(r'date', values);
  }

  List<Day?> getAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'date', values);
  }

  Future<int> deleteAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'date', values);
  }

  int deleteAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'date', values);
  }

  Future<Id> putByDate(Day object) {
    return putByIndex(r'date', object);
  }

  Id putByDateSync(Day object, {bool saveLinks = true}) {
    return putByIndexSync(r'date', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDate(List<Day> objects) {
    return putAllByIndex(r'date', objects);
  }

  List<Id> putAllByDateSync(List<Day> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'date', objects, saveLinks: saveLinks);
  }
}

extension DayQueryWhereSort on QueryBuilder<Day, Day, QWhere> {
  QueryBuilder<Day, Day, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Day, Day, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension DayQueryWhere on QueryBuilder<Day, Day, QWhereClause> {
  QueryBuilder<Day, Day, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Day, Day, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Day, Day, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Day, Day, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterWhereClause> dateEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterWhereClause> dateNotEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Day, Day, QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DayQueryFilter on QueryBuilder<Day, Day, QFilterCondition> {
  QueryBuilder<Day, Day, QAfterFilterCondition> dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DayQueryObject on QueryBuilder<Day, Day, QFilterCondition> {}

extension DayQueryLinks on QueryBuilder<Day, Day, QFilterCondition> {
  QueryBuilder<Day, Day, QAfterFilterCondition> plans(FilterQuery<Plan> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'plans');
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> plansLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'plans', length, true, length, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> plansIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'plans', 0, true, 0, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> plansIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'plans', 0, false, 999999, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> plansLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'plans', 0, true, length, include);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> plansLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'plans', length, include, 999999, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> plansLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'plans', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> goals(FilterQuery<Goal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'goals');
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> goalsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'goals', length, true, length, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> goalsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'goals', 0, true, 0, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> goalsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'goals', 0, false, 999999, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> goalsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'goals', 0, true, length, include);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> goalsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'goals', length, include, 999999, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> goalsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'goals', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tasks(FilterQuery<Task> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tasks');
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tasksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', length, true, length, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tasksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, true, 0, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tasksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, false, 999999, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tasksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, true, length, include);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tasksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', length, include, 999999, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tasksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tasks', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> reminders(
      FilterQuery<Reminder> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'reminders');
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> remindersLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'reminders', length, true, length, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> remindersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'reminders', 0, true, 0, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> remindersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'reminders', 0, false, 999999, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> remindersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'reminders', 0, true, length, include);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> remindersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'reminders', length, include, 999999, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> remindersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'reminders', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tocalls(FilterQuery<ToCall> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tocalls');
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tocallsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tocalls', length, true, length, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tocallsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tocalls', 0, true, 0, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tocallsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tocalls', 0, false, 999999, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tocallsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tocalls', 0, true, length, include);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tocallsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tocalls', length, include, 999999, true);
    });
  }

  QueryBuilder<Day, Day, QAfterFilterCondition> tocallsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tocalls', lower, includeLower, upper, includeUpper);
    });
  }
}

extension DayQuerySortBy on QueryBuilder<Day, Day, QSortBy> {
  QueryBuilder<Day, Day, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Day, Day, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }
}

extension DayQuerySortThenBy on QueryBuilder<Day, Day, QSortThenBy> {
  QueryBuilder<Day, Day, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Day, Day, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Day, Day, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Day, Day, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension DayQueryWhereDistinct on QueryBuilder<Day, Day, QDistinct> {
  QueryBuilder<Day, Day, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }
}

extension DayQueryProperty on QueryBuilder<Day, Day, QQueryProperty> {
  QueryBuilder<Day, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Day, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }
}
