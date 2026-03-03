# Hotspot

Endpoints for managing guest access via Hotspot vouchers — create, list, or revoke vouchers
and track their usage and expiration.

## Endpoints

---

### List Vouchers

`GET /v1/sites/{siteId}/hotspot/vouchers`

Retrieve a paginated list of Hotspot vouchers.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`createdAt`|`TIMESTAMP`|`eq` `ne` `gt` `ge` `lt` `le`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`code`|`STRING`|`eq` `ne` `in` `notIn`|
|`authorizedGuestLimit`|`INTEGER`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le`|
|`authorizedGuestCount`|`INTEGER`|`eq` `ne` `gt` `ge` `lt` `le`|
|`activatedAt`|`TIMESTAMP`|`eq` `ne` `gt` `ge` `lt` `le`|
|`expiresAt`|`TIMESTAMP`|`eq` `ne` `gt` `ge` `lt` `le`|
|`expired`|`BOOLEAN`|`eq` `ne`|
|`timeLimitMinutes`|`INTEGER`|`eq` `ne` `gt` `ge` `lt` `le`|
|`dataUsageLimitMBytes`|`INTEGER`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le`|
|`rxRateLimitKbps`|`INTEGER`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le`|
|`txRateLimitKbps`|`INTEGER`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/hotspot/vouchers?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Hotspot voucher detail page`

---

### Generate Vouchers

`POST /v1/sites/{siteId}/hotspot/vouchers`

Create one or more Hotspot vouchers.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `count` | `integer` | Number of vouchers to generate |
| `name` | `string` | Voucher note, duplicated across all generated vouchers |
| `authorizedGuestLimit` | `integer` | (Optional) limit for how many different guests can use the same voucher to authorize network access |
| `timeLimitMinutes` | `integer` | How long (in minutes) the voucher will provide access to the network since authorization of the first guest.
Subsequently connected guests, if allowed, will share the same expiration time. |
| `dataUsageLimitMBytes` | `integer` | (Optional) data usage limit in megabytes |
| `rxRateLimitKbps` | `integer` | (Optional) download rate limit in kilobits per second |
| `txRateLimitKbps` | `integer` | (Optional) upload rate limit in kilobits per second |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/hotspot/vouchers' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**201** Created

Schema: `IntegrationVoucherCreationResultDto`

---

### Delete Vouchers

`DELETE /v1/sites/{siteId}/hotspot/vouchers`

Remove Hotspot vouchers based on the specified filter criteria.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`createdAt`|`TIMESTAMP`|`eq` `ne` `gt` `ge` `lt` `le`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`code`|`STRING`|`eq` `ne` `in` `notIn`|
|`authorizedGuestLimit`|`INTEGER`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le`|
|`authorizedGuestCount`|`INTEGER`|`eq` `ne` `gt` `ge` `lt` `le`|
|`activatedAt`|`TIMESTAMP`|`eq` `ne` `gt` `ge` `lt` `le`|
|`expiresAt`|`TIMESTAMP`|`eq` `ne` `gt` `ge` `lt` `le`|
|`expired`|`BOOLEAN`|`eq` `ne`|
|`timeLimitMinutes`|`INTEGER`|`eq` `ne` `gt` `ge` `lt` `le`|
|`dataUsageLimitMBytes`|`INTEGER`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le`|
|`rxRateLimitKbps`|`INTEGER`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le`|
|`txRateLimitKbps`|`INTEGER`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `filter` | query | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X DELETE 'https://{host}/proxy/network/integration/v1/sites/:siteId/hotspot/vouchers?filter=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Voucher deletion results`

---

### Get Voucher Details

`GET /v1/sites/{siteId}/hotspot/vouchers/{voucherId}`

Retrieve details of a specific Hotspot voucher.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `voucherId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/hotspot/vouchers/:voucherId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Hotspot voucher details`

---

### Delete Voucher

`DELETE /v1/sites/{siteId}/hotspot/vouchers/{voucherId}`

Remove a specific Hotspot voucher.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `voucherId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X DELETE 'https://{host}/proxy/network/integration/v1/sites/:siteId/hotspot/vouchers/:voucherId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Voucher deletion results`

