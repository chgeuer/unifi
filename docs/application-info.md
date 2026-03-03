# Application Info

Returns general details about the UniFi Network application,
including version and runtime metadata. Useful for integration validation.

## Endpoints

---

### Get Application Info

`GET /v1/info`

Retrieve general information about the UniFi Network application.

**curl**

```bash
curl -X GET 'https://{host}/proxy/network/integration/v1/info' \
  -H 'X-API-Key: $UNIFI_LOCAL_API_KEY' \
  -H 'Accept: application/json'
```


### Responses

**200** OK

Schema: `Application info`

