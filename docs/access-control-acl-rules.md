# Access Control (ACL Rules)

Endpoints for creating, listing, and managing ACL (Access Control List) rule
that enforce traffic filtering across devices and networks.

## Endpoints

---

### Get ACL Rule

`GET /v1/sites/{siteId}/acl-rules/{aclRuleId}`


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `aclRuleId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/acl-rules/:aclRuleId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `ACL rule`

---

### Update ACL Rule

`PUT /v1/sites/{siteId}/acl-rules/{aclRuleId}`

Update an existing user defined ACL rule on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `aclRuleId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `type` | `string` |  |
| `enabled` | `boolean` |  |
| `name` | `string` | ACL rule name |
| `description` | `string` | ACL rule description |
| `action` | `string` | ACL rule action |
| `enforcingDeviceFilter` | `object` |  |
| `index` | `integer` | ACL rule index. This property is deprecated and has no effect. Use the dedicated ACL rule reordering endpoint. |
| `sourceFilter` | `object` | Traffic source filter |
| `destinationFilter` | `object` | Traffic destination filter |

**curl**

```bash
curl -X PUT 'https://{host}/proxy/network/integration/v1/sites/:siteId/acl-rules/:aclRuleId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `ACL rule`

---

### Delete ACL Rule

`DELETE /v1/sites/{siteId}/acl-rules/{aclRuleId}`

Delete an existing user defined ACL rule on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `aclRuleId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X DELETE 'https://{host}/proxy/network/integration/v1/sites/:siteId/acl-rules/:aclRuleId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

---

### Get User-Defined ACL Rule Ordering

`GET /v1/sites/{siteId}/acl-rules/ordering`

Retrieve user-defined ACL rule ordering on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/acl-rules/ordering' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `ACL rule ordering`

---

### Reorder User-Defined ACL Rules

`PUT /v1/sites/{siteId}/acl-rules/ordering`

Reorder user-defined ACL rules on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `orderedAclRuleIds` | `array` |  |

**curl**

```bash
curl -X PUT 'https://{host}/proxy/network/integration/v1/sites/:siteId/acl-rules/ordering' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `ACL rule ordering`

---

### List ACL Rules

`GET /v1/sites/{siteId}/acl-rules`

Retrieve a paginated list of all ACL rules on a site.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`type`|`STRING`|`eq` `ne` `in` `notIn`|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`enabled`|`BOOLEAN`|`eq` `ne`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`description`|`STRING`|`isNull` `isNotNull` `eq` `ne` `in` `notIn` `like`|
|`action`|`STRING`|`eq` `ne` `in` `notIn`|
|`index`|`INTEGER`|`eq` `ne` `gt` `ge` `lt` `le` `in` `notIn`|
|`protocolFilter`|`SET(STRING)`|`isNull` `isNotNull` `contains` `containsAny` `containsAll` `containsExactly`|
|`networkId`|`UUID`|`isNull` `isNotNull` `eq` `ne` `in` `notIn`|
|`enforcingDeviceFilter.deviceIds`|`SET(UUID)`|`isNull` `isNotNull` `contains` `containsAny` `containsAll` `containsExactly`|
|`metadata.origin`|`STRING`|`eq` `ne` `in` `notIn`|
|`sourceFilter.type`|`STRING`|`isNull` `isNotNull` `eq` `ne` `in` `notIn`|
|`sourceFilter.ipAddressesOrSubnets`|`SET(STRING)`|`contains` `containsAny` `containsAll` `containsExactly`|
|`sourceFilter.portFilter`|`SET(INTEGER)`|`isNull` `isNotNull` `contains` `containsAny` `containsAll` `containsExactly`|
|`sourceFilter.networkIds`|`SET(UUID)`|`contains` `containsAny` `containsAll` `containsExactly`|
|`sourceFilter.macAddresses`|`SET(STRING)`|`contains` `containsAny` `containsAll` `containsExactly`|
|`sourceFilter.prefixLength`|`INTEGER`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le` `in` `notIn`|
|`destinationFilter.type`|`STRING`|`isNull` `isNotNull` `eq` `ne` `in` `notIn`|
|`destinationFilter.ipAddressesOrSubnets`|`SET(STRING)`|`contains` `containsAny` `containsAll` `containsExactly`|
|`destinationFilter.portFilter`|`SET(INTEGER)`|`isNull` `isNotNull` `contains` `containsAny` `containsAll` `containsExactly`|
|`destinationFilter.networkIds`|`SET(UUID)`|`contains` `containsAny` `containsAll` `containsExactly`|
|`destinationFilter.macAddresses`|`SET(STRING)`|`contains` `containsAny` `containsAll` `containsExactly`|
|`destinationFilter.prefixLength`|`INTEGER`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le` `in` `notIn`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/acl-rules?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `IntegrationAclRulePageDto`

---

### Create ACL Rule

`POST /v1/sites/{siteId}/acl-rules`

Create a new user defined ACL rule on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `type` | `string` |  |
| `enabled` | `boolean` |  |
| `name` | `string` | ACL rule name |
| `description` | `string` | ACL rule description |
| `action` | `string` | ACL rule action |
| `enforcingDeviceFilter` | `object` |  |
| `index` | `integer` | ACL rule index. This property is deprecated and has no effect. Use the dedicated ACL rule reordering endpoint. |
| `sourceFilter` | `object` | Traffic source filter |
| `destinationFilter` | `object` | Traffic destination filter |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/acl-rules' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**201** Created

Schema: `ACL rule`

