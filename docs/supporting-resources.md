# Supporting Resources

Contains read-only reference endpoints used to retrieve supporting data
such as WAN interfaces, DPI categories, country codes, RADIUS profiles, and device tags.

## Endpoints

---

### List WAN Interfaces

`GET /v1/sites/{siteId}/wans`

Returns available WAN interface definitions for a given site,
including identifiers and names. Useful for network and NAT configuration.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/wans?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `WAN overview page`

---

### List Site-To-Site VPN Tunnels

`GET /v1/sites/{siteId}/vpn/site-to-site-tunnels`

Retrieve a paginated list of all site-to-site VPN tunnels on a site.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`type`|`STRING`|`eq` `ne` `in` `notIn`|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`metadata.origin`|`STRING`|`eq` `ne` `in` `notIn`|
|`metadata.source`|`STRING`|`eq` `ne` `in` `notIn` `isNull` `isNotNull`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/vpn/site-to-site-tunnels?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `IntegrationSiteToSiteVpnTunnelOverviewPageDto`

---

### List VPN Servers

`GET /v1/sites/{siteId}/vpn/servers`

Retrieve a paginated list of all VPN servers on a site.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`type`|`STRING`|`eq` `ne` `in` `notIn`|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`enabled`|`BOOLEAN`|`eq` `ne`|
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
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/vpn/servers?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `IntegrationVpnServerOverviewPageDto`

---

### List Radius Profiles

`GET /v1/sites/{siteId}/radius/profiles`

Returns available RADIUS authentication profiles, including configuration origin metadata.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
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
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/radius/profiles?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Radius Profile Overview Page`

---

### List Device Tags

`GET /v1/sites/{siteId}/device-tags`

Returns all device tags defined within a site, which can be used for WiFi Broadcast assignments.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`deviceIds`|`SET(UUID)`|`contains` `containsAny` `containsAll` `containsExactly`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/device-tags?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `IntegrationDeviceTagPageDto`

---

### List DPI Application Categories

`GET /v1/dpi/categories`

Returns predefined Deep Packet Inspection (DPI) application categories used for traffic identification and filtering.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`id`|`INTEGER`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/dpi/categories?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `DPI category page`

---

### List DPI Applications

`GET /v1/dpi/applications`

Lists DPI-recognized applications grouped under categories. Useful for firewall or traffic analytics integration.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`id`|`INTEGER`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/dpi/applications?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `DPI application page`

---

### List Countries

`GET /v1/countries`

Returns ISO-standard country codes and names,
used for region-based configuration or regulatory compliance.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`code`|`STRING`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/countries?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Country definition page`

