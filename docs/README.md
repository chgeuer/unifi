# UniFi Network API v10.1.85

Base path: `/integration`

## Sections

- [Getting Started](getting-started.md)
- [Filtering](filtering.md)
- [Error Handling](error-handling.md)
- [Application Info](application-info.md)
- [Sites](sites.md)
- [UniFi Devices](unifi-devices.md)
- [Clients](clients.md)
- [Networks](networks.md)
- [WiFi Broadcasts](wifi-broadcasts.md)
- [Hotspot](hotspot.md)
- [Firewall](firewall.md)
- [Access Control (ACL Rules)](access-control-acl-rules.md)
- [DNS Policies](dns-policies.md)
- [Traffic Matching Lists](traffic-matching-lists.md)
- [Supporting Resources](supporting-resources.md)

## All Endpoints

| Method | Path | Summary |
|--------|------|---------|
| `GET` | `/v1/countries` | List Countries |
| `GET` | `/v1/dpi/applications` | List DPI Applications |
| `GET` | `/v1/dpi/categories` | List DPI Application Categories |
| `GET` | `/v1/info` | Get Application Info |
| `GET` | `/v1/pending-devices` | List Devices Pending Adoption |
| `GET` | `/v1/sites` | List Local Sites |
| `GET` | `/v1/sites/{siteId}/acl-rules` | List ACL Rules |
| `POST` | `/v1/sites/{siteId}/acl-rules` | Create ACL Rule |
| `GET` | `/v1/sites/{siteId}/acl-rules/ordering` | Get User-Defined ACL Rule Ordering |
| `PUT` | `/v1/sites/{siteId}/acl-rules/ordering` | Reorder User-Defined ACL Rules |
| `GET` | `/v1/sites/{siteId}/acl-rules/{aclRuleId}` | Get ACL Rule |
| `PUT` | `/v1/sites/{siteId}/acl-rules/{aclRuleId}` | Update ACL Rule |
| `DELETE` | `/v1/sites/{siteId}/acl-rules/{aclRuleId}` | Delete ACL Rule |
| `GET` | `/v1/sites/{siteId}/clients` | List Connected Clients |
| `GET` | `/v1/sites/{siteId}/clients/{clientId}` | Get Connected Client Details |
| `POST` | `/v1/sites/{siteId}/clients/{clientId}/actions` | Execute Client Action |
| `GET` | `/v1/sites/{siteId}/device-tags` | List Device Tags |
| `GET` | `/v1/sites/{siteId}/devices` | List Adopted Devices |
| `POST` | `/v1/sites/{siteId}/devices` | Adopt Devices |
| `GET` | `/v1/sites/{siteId}/devices/{deviceId}` | Get Adopted Device Details |
| `DELETE` | `/v1/sites/{siteId}/devices/{deviceId}` | Remove (Unadopt) Device |
| `POST` | `/v1/sites/{siteId}/devices/{deviceId}/actions` | Execute Adopted Device Action |
| `POST` | `/v1/sites/{siteId}/devices/{deviceId}/interfaces/ports/{portIdx}/actions` | Execute Port Action |
| `GET` | `/v1/sites/{siteId}/devices/{deviceId}/statistics/latest` | Get Latest Adopted Device Statistics |
| `GET` | `/v1/sites/{siteId}/dns/policies` | List DNS Policies |
| `POST` | `/v1/sites/{siteId}/dns/policies` | Create DNS Policy |
| `GET` | `/v1/sites/{siteId}/dns/policies/{dnsPolicyId}` | Get DNS Policy |
| `PUT` | `/v1/sites/{siteId}/dns/policies/{dnsPolicyId}` | Update DNS Policy |
| `DELETE` | `/v1/sites/{siteId}/dns/policies/{dnsPolicyId}` | Delete DNS Policy |
| `GET` | `/v1/sites/{siteId}/firewall/policies` | List Firewall Policies |
| `POST` | `/v1/sites/{siteId}/firewall/policies` | Create Firewall Policy |
| `GET` | `/v1/sites/{siteId}/firewall/policies/ordering` | Get User-Defined Firewall Policy Ordering |
| `PUT` | `/v1/sites/{siteId}/firewall/policies/ordering` | Reorder User-Defined Firewall Policies |
| `GET` | `/v1/sites/{siteId}/firewall/policies/{firewallPolicyId}` | Get Firewall Policy |
| `PUT` | `/v1/sites/{siteId}/firewall/policies/{firewallPolicyId}` | Update Firewall Policy |
| `PATCH` | `/v1/sites/{siteId}/firewall/policies/{firewallPolicyId}` | Patch Firewall Policy |
| `DELETE` | `/v1/sites/{siteId}/firewall/policies/{firewallPolicyId}` | Delete Firewall Policy |
| `GET` | `/v1/sites/{siteId}/firewall/zones` | List Firewall Zones |
| `POST` | `/v1/sites/{siteId}/firewall/zones` | Create Custom Firewall Zone |
| `GET` | `/v1/sites/{siteId}/firewall/zones/{firewallZoneId}` | Get Firewall Zone |
| `PUT` | `/v1/sites/{siteId}/firewall/zones/{firewallZoneId}` | Update Firewall Zone |
| `DELETE` | `/v1/sites/{siteId}/firewall/zones/{firewallZoneId}` | Delete Custom Firewall Zone |
| `GET` | `/v1/sites/{siteId}/hotspot/vouchers` | List Vouchers |
| `POST` | `/v1/sites/{siteId}/hotspot/vouchers` | Generate Vouchers |
| `DELETE` | `/v1/sites/{siteId}/hotspot/vouchers` | Delete Vouchers |
| `GET` | `/v1/sites/{siteId}/hotspot/vouchers/{voucherId}` | Get Voucher Details |
| `DELETE` | `/v1/sites/{siteId}/hotspot/vouchers/{voucherId}` | Delete Voucher |
| `GET` | `/v1/sites/{siteId}/networks` | List Networks |
| `POST` | `/v1/sites/{siteId}/networks` | Create Network |
| `GET` | `/v1/sites/{siteId}/networks/{networkId}` | Get Network Details |
| `PUT` | `/v1/sites/{siteId}/networks/{networkId}` | Update Network |
| `DELETE` | `/v1/sites/{siteId}/networks/{networkId}` | Delete Network |
| `GET` | `/v1/sites/{siteId}/networks/{networkId}/references` | Get Network References |
| `GET` | `/v1/sites/{siteId}/radius/profiles` | List Radius Profiles |
| `GET` | `/v1/sites/{siteId}/traffic-matching-lists` | List Traffic Matching Lists |
| `POST` | `/v1/sites/{siteId}/traffic-matching-lists` | Create Traffic Matching List |
| `GET` | `/v1/sites/{siteId}/traffic-matching-lists/{trafficMatchingListId}` | Get Traffic Matching List |
| `PUT` | `/v1/sites/{siteId}/traffic-matching-lists/{trafficMatchingListId}` | Update Traffic Matching List |
| `DELETE` | `/v1/sites/{siteId}/traffic-matching-lists/{trafficMatchingListId}` | Delete Traffic Matching List |
| `GET` | `/v1/sites/{siteId}/vpn/servers` | List VPN Servers |
| `GET` | `/v1/sites/{siteId}/vpn/site-to-site-tunnels` | List Site-To-Site VPN Tunnels |
| `GET` | `/v1/sites/{siteId}/wans` | List WAN Interfaces |
| `GET` | `/v1/sites/{siteId}/wifi/broadcasts` | List Wifi Broadcasts |
| `POST` | `/v1/sites/{siteId}/wifi/broadcasts` | Create Wifi Broadcast |
| `GET` | `/v1/sites/{siteId}/wifi/broadcasts/{wifiBroadcastId}` | Get Wifi Broadcast Details |
| `PUT` | `/v1/sites/{siteId}/wifi/broadcasts/{wifiBroadcastId}` | Update Wifi Broadcast |
| `DELETE` | `/v1/sites/{siteId}/wifi/broadcasts/{wifiBroadcastId}` | Delete Wifi Broadcast |
