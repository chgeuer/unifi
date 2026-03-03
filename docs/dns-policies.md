# DNS Policies

Endpoints for managing DNS Policies within a site.

## Endpoints

---

### Get DNS Policy

`GET /v1/sites/{siteId}/dns/policies/{dnsPolicyId}`

Retrieve specific DNS policy.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `dnsPolicyId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/dns/policies/:dnsPolicyId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `DNS policy`

---

### Update DNS Policy

`PUT /v1/sites/{siteId}/dns/policies/{dnsPolicyId}`

Update an existing DNS policy on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `dnsPolicyId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `type` | `string` |  |
| `enabled` | `boolean` |  |

**curl**

```bash
curl -X PUT 'https://{host}/proxy/network/integration/v1/sites/:siteId/dns/policies/:dnsPolicyId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `DNS policy`

---

### Delete DNS Policy

`DELETE /v1/sites/{siteId}/dns/policies/{dnsPolicyId}`

Delete an existing DNS policy on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `dnsPolicyId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X DELETE 'https://{host}/proxy/network/integration/v1/sites/:siteId/dns/policies/:dnsPolicyId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

---

### List DNS Policies

`GET /v1/sites/{siteId}/dns/policies`

Retrieve a paginated list of all DNS policies on a site.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`type`|`STRING`|`eq` `ne` `in` `notIn`|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`enabled`|`BOOLEAN`|`eq` `ne`|
|`domain`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`ipv4Address`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`ipv6Address`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`targetDomain`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`mailServerDomain`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`text`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`serverDomain`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`ipAddress`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`ttlSeconds`|`INTEGER`|`eq` `ne` `gt` `ge` `lt` `le` `in` `notIn`|
|`priority`|`INTEGER`|`eq` `ne` `gt` `ge` `lt` `le` `in` `notIn`|
|`service`|`STRING`|`eq` `ne` `in` `notIn`|
|`protocol`|`STRING`|`eq` `ne` `in` `notIn`|
|`port`|`INTEGER`|`eq` `ne` `gt` `ge` `lt` `le` `in` `notIn`|
|`weight`|`INTEGER`|`eq` `ne` `gt` `ge` `lt` `le` `in` `notIn`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/dns/policies?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `IntegrationDnsPolicyPageDto`

---

### Create DNS Policy

`POST /v1/sites/{siteId}/dns/policies`

Create a new DNS policy on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `type` | `string` |  |
| `enabled` | `boolean` |  |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/dns/policies' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**201** Created

Schema: `DNS policy`

