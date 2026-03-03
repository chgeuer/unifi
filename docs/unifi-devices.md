# UniFi Devices

Endpoints to list, inspect, and interact with UniFi devices, including adopted and pending devices.
Provides device stats, port control, and actions.

## Endpoints

---

### List Adopted Devices

`GET /v1/sites/{siteId}/devices`

Retrieve a paginated list of all adopted devices on a site, including basic device information.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`macAddress`|`STRING`|`eq` `ne` `in` `notIn`|
|`ipAddress`|`STRING`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`model`|`STRING`|`eq` `ne` `in` `notIn`|
|`state`|`STRING`|`eq` `ne` `in` `notIn`|
|`supported`|`BOOLEAN`|`eq` `ne`|
|`firmwareVersion`|`STRING`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le` `like` `in` `notIn`|
|`firmwareUpdatable`|`BOOLEAN`|`eq` `ne`|
|`features`|`SET(STRING)`|`isEmpty` `contains` `containsAny` `containsAll` `containsExactly`|
|`interfaces`|`SET(STRING)`|`isEmpty` `contains` `containsAny` `containsAll` `containsExactly`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/devices?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Adopted device overview page`

---

### Adopt Devices

`POST /v1/sites/{siteId}/devices`

Adopt a device to a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `macAddress` | `string` |  |
| `ignoreDeviceLimit` | `boolean` |  |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/devices' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `Adopted device details`

---

### Execute Port Action

`POST /v1/sites/{siteId}/devices/{deviceId}/interfaces/ports/{portIdx}/actions`

Perform an action on a specific device port. The request body must include the action name and any applicable input arguments.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `portIdx` | path | `integer` | Yes |  |
| `siteId` | path | `string` | Yes |  |
| `deviceId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `action` | `string` |  |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/devices/:deviceId/interfaces/ports/:portIdx/actions' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

---

### Execute Adopted Device Action

`POST /v1/sites/{siteId}/devices/{deviceId}/actions`

Perform an action on an specific adopted device. The request body must include the action name and any applicable input arguments.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |
| `deviceId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `action` | `string` |  |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/devices/:deviceId/actions' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

---

### Get Adopted Device Details

`GET /v1/sites/{siteId}/devices/{deviceId}`

Retrieve detailed information about a specific adopted device, including firmware versioning, uplink state, details about device features and interfaces (ports, radios) and other key attributes.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |
| `deviceId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/devices/:deviceId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Adopted device details`

---

### Remove (Unadopt) Device

`DELETE /v1/sites/{siteId}/devices/{deviceId}`

Removes (unadopts) an adopted device from the site. If the device is online, it will be reset to factory defaults.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |
| `deviceId` | path | `string` | Yes |  |

**curl**

```bash
curl -X DELETE 'https://{host}/proxy/network/integration/v1/sites/:siteId/devices/:deviceId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

---

### Get Latest Adopted Device Statistics

`GET /v1/sites/{siteId}/devices/{deviceId}/statistics/latest`

Retrieve the latest real-time statistics of a specific adopted device, such as uptime, data transmission rates, CPU and memory utilization.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |
| `deviceId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/devices/:deviceId/statistics/latest' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Latest statistics for a device`

---

### List Devices Pending Adoption

`GET /v1/pending-devices`

Retrieve a paginated list of devices pending adoption, including basic device information.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`macAddress`|`STRING`|`eq` `ne` `in` `notIn`|
|`ipAddress`|`STRING`|`eq` `ne` `in` `notIn`|
|`model`|`STRING`|`eq` `ne` `in` `notIn`|
|`state`|`STRING`|`eq` `ne` `in` `notIn`|
|`supported`|`BOOLEAN`|`eq` `ne`|
|`firmwareVersion`|`STRING`|`isNull` `isNotNull` `eq` `ne` `gt` `ge` `lt` `le` `like` `in` `notIn`|
|`firmwareUpdatable`|`BOOLEAN`|`eq` `ne`|
|`features`|`SET(STRING)`|`isEmpty` `contains` `containsAny` `containsAll` `containsExactly`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/pending-devices?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Device pending adoption page`

