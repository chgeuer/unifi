# Filtering

Explains how to use the filter query parameter for advanced querying across list endpoints,
including supported property types, syntax, and operators.

Some `GET` and `DELETE` endpoints support filtering using the `filter` query parameter.
Each endpoint supporting filtering will have a detailed list of filterable properties, their types, and allowed functions.

### Filtering Syntax

Filtering follows a structured, URL-safe syntax with three types of expressions.

#### 1. Property Expressions

Apply functions to an individual property using the form `<property>.<function>(<arguments>)`,
where argument values are separated by commas.

Examples:

- `id.eq(123)` checks if `id` is equal to `123`;
- `name.isNotNull()` checks if `name` is not null;
- `createdAt.in(2025-01-01, 2025-01-05)` checks if `createdAt` is either `2025-01-01` or `2025-01-05`.

#### 2. Compound Expressions

Combine two or more expressions with logical operators using the form `<logical-operator>(<expressions>)`,
where expressions are separated by commas.

Examples:

- `and(name.isNull(), createdAt.gt(2025-01-01))` checks if `name` is null **and** `createdAt` is greater than `2025-01-01`;
- `or(name.isNull(), expired.isNull(), expiresAt.isNull())` check is **any** of `name`, `expired`, or `expiresAt` is null.

#### 3. Negation Expressions

Negate any other expressions using the the form `not(<expression>)`.

Example:

- `not(name.like('guest*'))` matches all values except those that start with `guest`.

### Filterable Property Types

The table below lists all supported property types.

|Type|Examples|Syntax|
|-|-|-|
|`STRING`|`'Hello, ''World''!'`|Must be wrapped in single quotes. To escape a single quote, use another single quote.|
|`INTEGER`|`123`|Must start with a digit.|
|`DECIMAL`|`123`, `123.321`|Must start with a digit. Can include a decimal point (.).|
|`TIMESTAMP`|`2025-01-29`, `2025-01-29T12:39:11Z`|Must follow ISO 8601 format (date or date-time).|
|`BOOLEAN`|`true`, `false`|Can be `true` or `false`.|
|`UUID`|`550e8400-e29b-41d4-a716-446655440000`|Must be a valid UUID format (8-4-4-4-12).|
|`SET(STRING\|INTEGER\|DECIMAL\|TIMESTAMP\|UUID)`|`[1, 2, 3, 4, 5]`|A set of (unique) values.|

### Filtering Functions

The table below lists available filtering functions, their arguments, and applicable property types:

|Function|Arguments|Semantics|Supported property types|
|-|-|-|-|
|`isNull`|0|is null|all types|
|`isNotNull`|0|is not null|all types|
|`eq`|1|equals|`STRING`, `INTEGER`, `DECIMAL`, `TIMESTAMP`, `BOOLEAN`, `UUID`|
|`ne`|1|not equals|`STRING`, `INTEGER`, `DECIMAL`, `TIMESTAMP`, `BOOLEAN`, `UUID`|
|`gt`|1|greater than|`STRING`, `INTEGER`, `DECIMAL`, `TIMESTAMP`, `UUID`|
|`ge`|1|greater than or equals|`STRING`, `INTEGER`, `DECIMAL`, `TIMESTAMP`, `UUID`|
|`lt`|1|less than|`STRING`, `INTEGER`, `DECIMAL`, `TIMESTAMP`, `UUID`|
|`le`|1|less than or equals|`STRING`, `INTEGER`, `DECIMAL`, `TIMESTAMP`, `UUID`|
|`like`|1|matches pattern|`STRING`|
|`in`|1 or more|one of|`STRING`, `INTEGER`, `DECIMAL`, `TIMESTAMP`, `UUID`|
|`notIn`|1 or more|not one of|`STRING`, `INTEGER`, `DECIMAL`, `TIMESTAMP`, `UUID`|
|`isEmpty`|0|is empty|`SET`|
|`contains`|1|contains|`SET`|
|`containsAny`|1 or more|contains any of|`SET`|
|`containsAll`|1 or more|contains all of|`SET`|
|`containsExactly`|1 or more|contains exactly|`SET`|

#### Pattern Matching (`like` Function)

The `like` function allows matching string properties using simple patterns:

- `.` matches any **single** character. Example: `type.like('type.')` matches `type1`, but not `type100`;
- `*` matches **any number** of characters. Example: `name.like('guest*')` matches `guest1` and `guest100`;
- `\` is used to escape `.` and `*`.

*(No endpoints)*
