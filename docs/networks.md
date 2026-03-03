# Networks

Endpoints for creating, updating, deleting, and inspecting network configurations
including VLANs, DHCP, NAT, and IPv4/IPv6 settings.

## Endpoints

---

### Get Network Details

`GET /v1/sites/{siteId}/networks/{networkId}`

Retrieve detailed information about a specific network.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `networkId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/networks/:networkId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Network details`

---

### Update Network

`PUT /v1/sites/{siteId}/networks/{networkId}`

Update an existing network on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `networkId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `management` | `string` |  |
| `name` | `string` |  |
| `enabled` | `boolean` |  |
| `vlanId` | `integer` | VLAN ID. Must be 1 for the default network and >= 2 for additional networks. |
| `dhcpGuarding` | `object` | Details about DHCP Guarding settings for this Network. |

**curl**

```bash
curl -X PUT 'https://{host}/proxy/network/integration/v1/sites/:siteId/networks/:networkId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `Network details`

---

### Delete Network

`DELETE /v1/sites/{siteId}/networks/{networkId}`

Delete an existing network on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `networkId` | path | `string` | Yes |  |
| `force` | query | `boolean` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X DELETE 'https://{host}/proxy/network/integration/v1/sites/:siteId/networks/:networkId?force=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

---

### List Networks

`GET /v1/sites/{siteId}/networks`

Retrieve a paginated list of all Networks on a site.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`management`|`STRING`|`eq` `ne` `in` `notIn`|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`enabled`|`BOOLEAN`|`eq` `ne`|
|`vlanId`|`INTEGER`|`eq` `ne` `gt` `ge` `lt` `le` `in` `notIn`|
|`deviceId`|`UUID`|`eq` `ne` `in` `notIn` `isNull` `isNotNull`|
|`metadata.origin`|`STRING`|`eq` `ne` `in` `notIn`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/networks?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Network overview page`

---

### Create Network

`POST /v1/sites/{siteId}/networks`

Create a new network on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `management` | `string` |  |
| `name` | `string` |  |
| `enabled` | `boolean` |  |
| `vlanId` | `integer` | VLAN ID. Must be 1 for the default network and >= 2 for additional networks. |
| `dhcpGuarding` | `object` | Details about DHCP Guarding settings for this Network. |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/networks' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**201** Created

Schema: `Network details`

---

### Get Network References

`GET /v1/sites/{siteId}/networks/{networkId}/references`

Retrieve references to a specific network.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `networkId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/networks/:networkId/references' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Network references`

