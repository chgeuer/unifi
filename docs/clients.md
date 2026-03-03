# Clients

Endpoints for viewing and managing connected clients (wired, wireless, VPN, and guest).
Supports actions such as authorizing or unauthorizing guest access.

## Endpoints

---

### Execute Client Action

`POST /v1/sites/{siteId}/clients/{clientId}/actions`

Perform an action on a specific connected client. The request body must include the action name and any applicable input arguments.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `clientId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `action` | `string` |  |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/clients/:clientId/actions' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `Client action response`

---

### List Connected Clients

`GET /v1/sites/{siteId}/clients`

Retrieve a paginated list of all connected clients on a site, including physical devices (computers, smartphones) and active VPN connections.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`type`|`STRING`|`eq` `ne` `in` `notIn`|
|`macAddress`|`STRING`|`isNull` `isNotNull` `eq` `ne` `in` `notIn`|
|`ipAddress`|`STRING`|`isNull` `isNotNull` `eq` `ne` `in` `notIn`|
|`connectedAt`|`TIMESTAMP`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le`|
|`access.type`|`STRING`|`eq` `ne` `in` `notIn`|
|`access.authorized`|`BOOLEAN`|`isNull` `isNotNull` `eq` `ne`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/clients?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Client overview page`

---

### Get Connected Client Details

`GET /v1/sites/{siteId}/clients/{clientId}`

Retrieve detailed information about a specific connected client, including name, IP address, MAC address, connection type and access information.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `clientId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/clients/:clientId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Client details`

