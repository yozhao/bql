namespace java bql.api

enum BooleanClauseOccur {
  SHOULD = 0,
  MUST,
  MUST_NOT,
}

struct TermFilter {
  1: required string field
  2: optional list<string> values
  3: optional list<string> excludes
}

struct RangeFilter {
  1: required string field
  3: required string startValue
  4: required string endValue
  5: required bool startClosed
  6: required bool endClosed
}

struct StringQuery {
  1: required string query
  2: optional list<string> fields
  3: optional BooleanClauseOccur occur = BooleanClauseOccur.SHOULD
}

struct WildcardQuery {
  1: required string query
  2: required string field
}

struct Query {
  1: optional StringQuery stringQuery
  2: optional WildcardQuery wildcardQuery
}

struct QueryFilter {
  1: required Query query
}

// pre-defintion
struct BooleanFilter {
}

struct Filter {
  1: optional QueryFilter queryFilter
  2: optional TermFilter termFilter
  3: optional RangeFilter rangeFilter
  4: optional BooleanFilter booleanFilter
}

struct BooleanSubFilter {
  1: optional BooleanClauseOccur occur = BooleanClauseOccur.SHOULD
  2: optional Filter filter
}

struct BooleanFilter {
  1: required list<BooleanSubFilter> filters,
}

struct PagingParam {
  1: optional i32 offset
  2: optional i32 count = 10
}

enum SortMode {
  SCORE = 0,
  CUSTOM = 1
}

struct SortField {
  1: optional SortMode mode = SortMode.SCORE
  2: optional string field
  3: optional bool reverse
}

enum FacetSortMode {
  HITS_DESC = 0,
  VALUE_ASC = 1
}

struct FacetParam {
  1: optional FacetSortMode mode = FacetSortMode.HITS_DESC
  2: optional i32 maxNumValues = 5
  3: optional i32 minCount = 1
}

struct Request {
  1: optional Query query
  2: optional Filter filter
  3: optional list<SortField> sortFields
  4: optional map<string, FacetParam> facetParams
  5: optional PagingParam pagingParam
  6: optional bool fetchSrcData
  7: optional bool explain
}
