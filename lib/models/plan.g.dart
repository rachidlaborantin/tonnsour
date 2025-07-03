// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlanCollection on Isar {
  IsarCollection<Plan> get plans => this.collection();
}

const PlanSchema = CollectionSchema(
  name: r'Plan',
  id: 8143067535675439181,
  properties: {
    r'hour': PropertySchema(
      id: 0,
      name: r'hour',
      type: IsarType.string,
    ),
    r'isHourEditable': PropertySchema(
      id: 1,
      name: r'isHourEditable',
      type: IsarType.bool,
    ),
    r'period': PropertySchema(
      id: 2,
      name: r'period',
      type: IsarType.string,
    ),
    r'plan': PropertySchema(
      id: 3,
      name: r'plan',
      type: IsarType.string,
    ),
    r'timePassed': PropertySchema(
      id: 4,
      name: r'timePassed',
      type: IsarType.bool,
    )
  },
  estimateSize: _planEstimateSize,
  serialize: _planSerialize,
  deserialize: _planDeserialize,
  deserializeProp: _planDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _planGetId,
  getLinks: _planGetLinks,
  attach: _planAttach,
  version: '3.1.0+1',
);

int _planEstimateSize(
  Plan object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.hour.length * 3;
  bytesCount += 3 + object.period.length * 3;
  bytesCount += 3 + object.plan.length * 3;
  return bytesCount;
}

void _planSerialize(
  Plan object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.hour);
  writer.writeBool(offsets[1], object.isHourEditable);
  writer.writeString(offsets[2], object.period);
  writer.writeString(offsets[3], object.plan);
  writer.writeBool(offsets[4], object.timePassed);
}

Plan _planDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Plan();
  object.hour = reader.readString(offsets[0]);
  object.id = id;
  object.isHourEditable = reader.readBool(offsets[1]);
  object.period = reader.readString(offsets[2]);
  object.plan = reader.readString(offsets[3]);
  object.timePassed = reader.readBool(offsets[4]);
  return object;
}

P _planDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _planGetId(Plan object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _planGetLinks(Plan object) {
  return [];
}

void _planAttach(IsarCollection<dynamic> col, Id id, Plan object) {
  object.id = id;
}

extension PlanQueryWhereSort on QueryBuilder<Plan, Plan, QWhere> {
  QueryBuilder<Plan, Plan, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlanQueryWhere on QueryBuilder<Plan, Plan, QWhereClause> {
  QueryBuilder<Plan, Plan, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Plan, Plan, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Plan, Plan, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Plan, Plan, QAfterWhereClause> idBetween(
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
}

extension PlanQueryFilter on QueryBuilder<Plan, Plan, QFilterCondition> {
  QueryBuilder<Plan, Plan, QAfterFilterCondition> hourEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> hourGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> hourLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> hourBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> hourStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> hourEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> hourContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hour',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> hourMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hour',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> hourIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: '',
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> hourIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hour',
        value: '',
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Plan, Plan, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Plan, Plan, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Plan, Plan, QAfterFilterCondition> isHourEditableEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHourEditable',
        value: value,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> periodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> periodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> periodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> periodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'period',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> periodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> periodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> periodContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'period',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> periodMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'period',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> periodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'period',
        value: '',
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> periodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'period',
        value: '',
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> planEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> planGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> planLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> planBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> planStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> planEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> planContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> planMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plan',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> planIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plan',
        value: '',
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> planIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plan',
        value: '',
      ));
    });
  }

  QueryBuilder<Plan, Plan, QAfterFilterCondition> timePassedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timePassed',
        value: value,
      ));
    });
  }
}

extension PlanQueryObject on QueryBuilder<Plan, Plan, QFilterCondition> {}

extension PlanQueryLinks on QueryBuilder<Plan, Plan, QFilterCondition> {}

extension PlanQuerySortBy on QueryBuilder<Plan, Plan, QSortBy> {
  QueryBuilder<Plan, Plan, QAfterSortBy> sortByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> sortByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> sortByIsHourEditable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHourEditable', Sort.asc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> sortByIsHourEditableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHourEditable', Sort.desc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> sortByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.asc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> sortByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.desc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> sortByPlan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plan', Sort.asc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> sortByPlanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plan', Sort.desc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> sortByTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.asc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> sortByTimePassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.desc);
    });
  }
}

extension PlanQuerySortThenBy on QueryBuilder<Plan, Plan, QSortThenBy> {
  QueryBuilder<Plan, Plan, QAfterSortBy> thenByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> thenByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> thenByIsHourEditable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHourEditable', Sort.asc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> thenByIsHourEditableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHourEditable', Sort.desc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> thenByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.asc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> thenByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'period', Sort.desc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> thenByPlan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plan', Sort.asc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> thenByPlanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plan', Sort.desc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> thenByTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.asc);
    });
  }

  QueryBuilder<Plan, Plan, QAfterSortBy> thenByTimePassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timePassed', Sort.desc);
    });
  }
}

extension PlanQueryWhereDistinct on QueryBuilder<Plan, Plan, QDistinct> {
  QueryBuilder<Plan, Plan, QDistinct> distinctByHour(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hour', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Plan, Plan, QDistinct> distinctByIsHourEditable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isHourEditable');
    });
  }

  QueryBuilder<Plan, Plan, QDistinct> distinctByPeriod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'period', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Plan, Plan, QDistinct> distinctByPlan(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plan', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Plan, Plan, QDistinct> distinctByTimePassed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timePassed');
    });
  }
}

extension PlanQueryProperty on QueryBuilder<Plan, Plan, QQueryProperty> {
  QueryBuilder<Plan, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Plan, String, QQueryOperations> hourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hour');
    });
  }

  QueryBuilder<Plan, bool, QQueryOperations> isHourEditableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isHourEditable');
    });
  }

  QueryBuilder<Plan, String, QQueryOperations> periodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'period');
    });
  }

  QueryBuilder<Plan, String, QQueryOperations> planProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plan');
    });
  }

  QueryBuilder<Plan, bool, QQueryOperations> timePassedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timePassed');
    });
  }
}
