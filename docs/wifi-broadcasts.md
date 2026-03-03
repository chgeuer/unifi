# WiFi Broadcasts

Endpoints to create, update, or remove WiFi networks (SSIDs).
Supports configuration of security, band steering, multicast filtering, and captive portals.

## Endpoints

---

### Get Wifi Broadcast Details

`GET /v1/sites/{siteId}/wifi/broadcasts/{wifiBroadcastId}`

Retrieve detailed information about a specific Wifi.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `wifiBroadcastId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/wifi/broadcasts/:wifiBroadcastId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Wifi broadcast details`

---

### Update Wifi Broadcast

`PUT /v1/sites/{siteId}/wifi/broadcasts/{wifiBroadcastId}`

Update an existing Wifi Broadcast on the specified site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `wifiBroadcastId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `type` | `string` |  |
| `name` | `string` |  |
| `network` | `object` |  |
| `enabled` | `boolean` |  |
| `securityConfiguration` | `object` |  |
| `broadcastingDeviceFilter` | `object` |  |
| `mdnsProxyConfiguration` | `object` |  |
| `multicastFilteringPolicy` | `object` |  |
| `multicastToUnicastConversionEnabled` | `boolean` |  |
| `clientIsolationEnabled` | `boolean` |  |
| `hideName` | `boolean` |  |
| `uapsdEnabled` | `boolean` | Indicates whether Unscheduled Automatic Power Save Delivery (U-APSD) is enabled |
| `basicDataRateKbpsByFrequencyGHz` | `object` |  |
| `clientFilteringPolicy` | `object` |  |
| `blackoutScheduleConfiguration` | `object` |  |

**curl**

```bash
curl -X PUT 'https://{host}/proxy/network/integration/v1/sites/:siteId/wifi/broadcasts/:wifiBroadcastId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `Wifi broadcast details`

---

### Delete Wifi Broadcast

`DELETE /v1/sites/{siteId}/wifi/broadcasts/{wifiBroadcastId}`

Delete an existing Wifi Broadcast from the specified site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `wifiBroadcastId` | path | `string` | Yes |  |
| `force` | query | `boolean` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X DELETE 'https://{host}/proxy/network/integration/v1/sites/:siteId/wifi/broadcasts/:wifiBroadcastId?force=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

---

### List Wifi Broadcasts

`GET /v1/sites/{siteId}/wifi/broadcasts`

Retrieve a paginated list of all Wifi Broadcasts on a site.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`type`|`STRING`|`eq` `ne` `in` `notIn`|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`enabled`|`BOOLEAN`|`eq` `ne`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`broadcastingFrequenciesGHz`|`SET(DECIMAL)`|`contains` `containsAny` `containsAll` `containsExactly`|
|`metadata.origin`|`STRING`|`eq` `ne` `in` `notIn`|
|`network.type`|`STRING`|`eq` `ne` `in` `notIn` `isNull` `isNotNull`|
|`network.networkId`|`UUID`|`eq` `ne` `in` `notIn`|
|`securityConfiguration.type`|`STRING`|`eq` `ne` `in` `notIn`|
|`broadcastingDeviceFilter.type`|`STRING`|`eq` `ne` `in` `notIn` `isNull` `isNotNull`|
|`broadcastingDeviceFilter.deviceIds`|`SET(UUID)`|`contains` `containsAny` `containsAll` `containsExactly`|
|`broadcastingDeviceFilter.deviceTagIds`|`SET(UUID)`|`contains` `containsAny` `containsAll` `containsExactly`|
|`hotspotConfiguration.type`|`STRING`|`eq` `ne` `in` `notIn`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/wifi/broadcasts?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `IntegrationWifiBroadcastPageDto`

---

### Create Wifi Broadcast

`POST /v1/sites/{siteId}/wifi/broadcasts`

Create a new Wifi Broadcast on the specified site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `type` | `string` |  |
| `name` | `string` |  |
| `network` | `object` |  |
| `enabled` | `boolean` |  |
| `securityConfiguration` | `object` |  |
| `broadcastingDeviceFilter` | `object` |  |
| `mdnsProxyConfiguration` | `object` |  |
| `multicastFilteringPolicy` | `object` |  |
| `multicastToUnicastConversionEnabled` | `boolean` |  |
| `clientIsolationEnabled` | `boolean` |  |
| `hideName` | `boolean` |  |
| `uapsdEnabled` | `boolean` | Indicates whether Unscheduled Automatic Power Save Delivery (U-APSD) is enabled |
| `basicDataRateKbpsByFrequencyGHz` | `object` |  |
| `clientFilteringPolicy` | `object` |  |
| `blackoutScheduleConfiguration` | `object` |  |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/wifi/broadcasts' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**201** Created

Schema: `Wifi broadcast details`

