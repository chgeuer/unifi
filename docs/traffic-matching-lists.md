# Traffic Matching Lists

Endpoints for managing port and IP address lists used across firewall policy configurations.

## Endpoints

---

### Get Traffic Matching List

`GET /v1/sites/{siteId}/traffic-matching-lists/{trafficMatchingListId}`

Get an exist traffic matching list on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `trafficMatchingListId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/traffic-matching-lists/:trafficMatchingListId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Traffic matching list`

---

### Update Traffic Matching List

`PUT /v1/sites/{siteId}/traffic-matching-lists/{trafficMatchingListId}`

Update an exist traffic matching list on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `trafficMatchingListId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `type` | `string` |  |
| `name` | `string` |  |

**curl**

```bash
curl -X PUT 'https://{host}/proxy/network/integration/v1/sites/:siteId/traffic-matching-lists/:trafficMatchingListId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `Traffic matching list`

---

### Delete Traffic Matching List

`DELETE /v1/sites/{siteId}/traffic-matching-lists/{trafficMatchingListId}`

Delete an exist traffic matching list on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `trafficMatchingListId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X DELETE 'https://{host}/proxy/network/integration/v1/sites/:siteId/traffic-matching-lists/:trafficMatchingListId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

---

### List Traffic Matching Lists

`GET /v1/sites/{siteId}/traffic-matching-lists`

Retrieve all traffic matching lists on a site.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/traffic-matching-lists?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Traffic matching lists page`

---

### Create Traffic Matching List

`POST /v1/sites/{siteId}/traffic-matching-lists`

Create a new traffic matching list on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `type` | `string` |  |
| `name` | `string` |  |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/traffic-matching-lists' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**201** Created

Schema: `Traffic matching list`

