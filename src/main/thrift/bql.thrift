namespace java bql.api

enum SelectionMode {
  SHOULD = 0,
  MUST = 1,
  MUST_NOT = 2
}

enum SelectionType {
  TERM = 0,
  RANGE = 1
}

struct Selection {
  1: optional list<string> values
  2: optional SelectionMode mode = SelectionMode.SHOULD
  3: optional SelectionType type = SelectionType.TERM
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
  1: optional map<string,list<Selection>> selections
  2: optional map<string,FacetParam> facetParams
  3: optional PagingParam pagingParam
  4: optional list<SortField> sortFields
  5: optional string queryString
  6: optional bool fetchSrcData
  7: optional bool explain
}
