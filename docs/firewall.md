# Firewall

Endpoints for managing custom firewall zones and policies within a site.
Define or update network segmentation and security boundaries.

## Endpoints

---

### Get Firewall Zone

`GET /v1/sites/{siteId}/firewall/zones/{firewallZoneId}`

Get a firewall zone on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `firewallZoneId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/zones/:firewallZoneId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Firewall zone`

---

### Update Firewall Zone

`PUT /v1/sites/{siteId}/firewall/zones/{firewallZoneId}`

Update a firewall zone on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `firewallZoneId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `name` | `string` | Name of a firewall zone |
| `networkIds` | `array` | List of Network IDs |

**curl**

```bash
curl -X PUT 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/zones/:firewallZoneId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `Firewall zone`

---

### Delete Custom Firewall Zone

`DELETE /v1/sites/{siteId}/firewall/zones/{firewallZoneId}`

Delete a custom firewall zone from a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `firewallZoneId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X DELETE 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/zones/:firewallZoneId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

---

### Get Firewall Policy

`GET /v1/sites/{siteId}/firewall/policies/{firewallPolicyId}`

Retrieve specific firewall policy.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `firewallPolicyId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/policies/:firewallPolicyId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Firewall policy`

---

### Update Firewall Policy

`PUT /v1/sites/{siteId}/firewall/policies/{firewallPolicyId}`

Update an existing firewall policy on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `firewallPolicyId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `enabled` | `boolean` |  |
| `name` | `string` |  |
| `description` | `string` |  |
| `action` | `object` | Defines action for matched traffic. |
| `source` | `object` |  |
| `destination` | `object` |  |
| `ipProtocolScope` | `object` | Defines rules for matching by IP version and protocol. |
| `connectionStateFilter` | `array` | Match on firewall connection state. If null, matches all connection states. |
| `ipsecFilter` | `string` | Match on traffic encrypted, or not encrypted by IPsec. If null, matches all traffic. |
| `loggingEnabled` | `boolean` | Generate syslog entries when traffic is matched. Such entries are sent to a remote syslog server. |
| `schedule` | `object` | Defines date and time when the entity is active. If null, the entity is always active. |

**curl**

```bash
curl -X PUT 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/policies/:firewallPolicyId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `Firewall policy`

---

### Delete Firewall Policy

`DELETE /v1/sites/{siteId}/firewall/policies/{firewallPolicyId}`

Delete an existing firewall policy on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `firewallPolicyId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X DELETE 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/policies/:firewallPolicyId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

---

### Patch Firewall Policy

`PATCH /v1/sites/{siteId}/firewall/policies/{firewallPolicyId}`

Patch an existing firewall policy on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `firewallPolicyId` | path | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `loggingEnabled` | `boolean` |  |

**curl**

```bash
curl -X PATCH 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/policies/:firewallPolicyId' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `Firewall policy`

---

### Get User-Defined Firewall Policy Ordering

`GET /v1/sites/{siteId}/firewall/policies/ordering`

Retrieve user-defined firewall policy ordering for a specific source/destination zone pair.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `sourceFirewallZoneId` | query | `string` | Yes |  |
| `destinationFirewallZoneId` | query | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/policies/ordering?sourceFirewallZoneId=value&destinationFirewallZoneId=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `IntegrationFirewallPolicyOrderingDto`

---

### Reorder User-Defined Firewall Policies

`PUT /v1/sites/{siteId}/firewall/policies/ordering`

Reorder user-defined firewall policies for a specific source/destination zone pair.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `sourceFirewallZoneId` | query | `string` | Yes |  |
| `destinationFirewallZoneId` | query | `string` | Yes |  |
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `orderedFirewallPolicyIds` | `object` |  |

**curl**

```bash
curl -X PUT 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/policies/ordering?sourceFirewallZoneId=value&destinationFirewallZoneId=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**200** OK

Schema: `IntegrationFirewallPolicyOrderingDto`

---

### List Firewall Zones

`GET /v1/sites/{siteId}/firewall/zones`

Retrieve a list of all firewall zones on a site.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`metadata.origin`|`STRING`|`eq` `ne` `in` `notIn`|
|`metadata.configurable`|`BOOLEAN`|`eq` `ne` `isNull` `isNotNull`|
</details>


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `offset` | query | `integer` | No |  |
| `limit` | query | `integer` | No |  |
| `filter` | query | `string` | No |  |
| `siteId` | path | `string` | Yes |  |

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/zones?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Firewall zones page`

---

### Create Custom Firewall Zone

`POST /v1/sites/{siteId}/firewall/zones`

Create a new custom firewall zone on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `name` | `string` | Name of a firewall zone |
| `networkIds` | `array` | List of Network IDs |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/zones' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**201** Created

Schema: `Firewall zone`

---

### List Firewall Policies

`GET /v1/sites/{siteId}/firewall/policies`

Retrieve a list of all firewall policies on a site.

<details>
<summary>Filterable properties (click to expand)</summary>

|Name|Type|Allowed functions|
|-|-|-|
|`id`|`UUID`|`eq` `ne` `in` `notIn`|
|`name`|`STRING`|`eq` `ne` `in` `notIn` `like`|
|`source.zoneId`|`UUID`|`eq` `ne` `in` `notIn`|
|`destination.zoneId`|`UUID`|`eq` `ne` `in` `notIn`|
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
curl -X GET 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/policies?offset=value&limit=value' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Firewall policy page`

---

### Create Firewall Policy

`POST /v1/sites/{siteId}/firewall/policies`

Create a new firewall policy on a site.


| Parameter | In | Type | Required | Description |
|-----------|-----|------|----------|-------------|
| `siteId` | path | `string` | Yes |  |


**Request Body** (`application/json`)

| Field | Type | Description |
|-------|------|-------------|
| `enabled` | `boolean` |  |
| `name` | `string` |  |
| `description` | `string` |  |
| `action` | `object` | Defines action for matched traffic. |
| `source` | `object` |  |
| `destination` | `object` |  |
| `ipProtocolScope` | `object` | Defines rules for matching by IP version and protocol. |
| `connectionStateFilter` | `array` | Match on firewall connection state. If null, matches all connection states. |
| `ipsecFilter` | `string` | Match on traffic encrypted, or not encrypted by IPsec. If null, matches all traffic. |
| `loggingEnabled` | `boolean` | Generate syslog entries when traffic is matched. Such entries are sent to a remote syslog server. |
| `schedule` | `object` | Defines date and time when the entity is active. If null, the entity is always active. |

**curl**

```bash
curl -X POST 'https://{host}/proxy/network/integration/v1/sites/:siteId/firewall/policies' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{...}'
```


### Responses

**201** Created

Schema: `Firewall policy`

