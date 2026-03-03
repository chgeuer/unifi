# UniFi

Elixir client for the UniFi Network API — both the official integration API and the undocumented legacy controller API.

## Prerequisites

- Elixir 1.17+
- A UniFi OS console (UDM, UDM Pro, UDM SE, etc.) on your local network

## Setup

### 1. Create a local API key

1. Open your console's web UI (e.g., `https://192.168.1.1`)
2. Navigate to **Integrations (the power plug symbol at the left bottom)**
3. Under **API Keys**, click **Create New API Key**
4. Copy the key (it's shown only once)

<img width="1306" height="955" alt="image" src="https://github.com/user-attachments/assets/9733a463-4b31-461f-b12f-adeba5f688c2" />

### 2. Set the environment variable

```bash
export UNIFI_LOCAL_API_KEY="your-api-key-here"

# Optional: if your console isn't at 192.168.1.1
export UNIFI_CONSOLE_URL="https://10.0.0.1"
```

### 3. Install dependencies

```bash
mix deps.get
```

## Usage

### As a library

```elixir
# Official Integration API (documented, clean)
req = UniFi.Network.client(
  base_url: "https://192.168.1.1/proxy/network/integration",
  api_key: System.fetch_env!("UNIFI_LOCAL_API_KEY"),
  verify: false
)

{:ok, %{body: %{"data" => sites}}} = UniFi.Network.Sites.list(req)
{:ok, %{body: %{"data" => clients}}} = UniFi.Network.Clients.list(req, site_id)

# Legacy Controller API (undocumented, much richer data)
legacy = UniFi.Network.Legacy.client(
  base_url: "https://192.168.1.1",
  api_key: System.fetch_env!("UNIFI_LOCAL_API_KEY"),
  verify: false
)

{:ok, %{body: %{"data" => clients}}} = UniFi.Network.Legacy.Stats.clients(legacy)
# 91 fields per client: RSSI, signal, channel, satisfaction, DPI, roam count, ...

# UniFi OS System API
sys = UniFi.Network.System.client(
  base_url: "https://192.168.1.1",
  api_key: System.fetch_env!("UNIFI_LOCAL_API_KEY"),
  verify: false
)

{:ok, %{body: info}} = UniFi.Network.System.info(sys)
```

### Running scripts

Each script in `scripts/` is self-contained and executable:

```bash
UNIFI_LOCAL_API_KEY=your-key elixir scripts/list_clients.exs
```

## API Coverage

### Official Integration API (`UniFi.Network.*`)

38 endpoints at `/proxy/network/integration/v1/...` — documented at
[developer.ui.com](https://developer.ui.com/network/v10.1.84/gettingstarted).

| Module | Endpoints |
|--------|-----------|
| `UniFi.Network.Info` | Application info |
| `UniFi.Network.Sites` | List local sites |
| `UniFi.Network.Devices` | List/get/adopt/remove devices, actions, port actions, statistics, pending |
| `UniFi.Network.Clients` | List/get connected clients, execute actions |
| `UniFi.Network.Networks` | CRUD networks, get references |
| `UniFi.Network.WiFi` | CRUD WiFi broadcasts |
| `UniFi.Network.Hotspot` | List/create/delete vouchers |
| `UniFi.Network.Firewall` | CRUD zones and policies, get/update ordering |
| `UniFi.Network.ACL` | CRUD ACL rules, get/update ordering |
| `UniFi.Network.DNS` | CRUD DNS policies |
| `UniFi.Network.TrafficMatching` | CRUD traffic matching lists |
| `UniFi.Network.Supporting` | WANs, VPN tunnels/servers, RADIUS profiles, device tags, DPI categories/apps, countries |

### Legacy Controller API (`UniFi.Network.Legacy.*`)

Undocumented endpoints at `/proxy/network/api/s/{site}/...` — far richer data.

| Module | Endpoints |
|--------|-----------|
| `UniFi.Network.Legacy.Stats` | sysinfo, health, devices, clients (91 fields!), guests, rogue APs, events, alarms, DPI, channels, spectrum, routing, vouchers, payments, authorizations |
| `UniFi.Network.Legacy.Settings` | List/get/update all 35 setting categories (SSH, DPI, guest access, NTP, country, IPS, etc.) |
| `UniFi.Network.Legacy.PortForwards` | CRUD port forwarding rules |
| `UniFi.Network.Legacy.Routing` | CRUD static routes, routing stats |
| `UniFi.Network.Legacy.FirewallRules` | CRUD legacy firewall rules and groups |
| `UniFi.Network.Legacy.Users` | List/update known users (historical), user groups |
| `UniFi.Network.Legacy.WLANConf` | List/get/update WLAN configurations |
| `UniFi.Network.Legacy.NetworkConf` | CRUD network configurations (WAN, LAN, VPN) |
| `UniFi.Network.Legacy.Misc` | Port profiles, dynamic DNS, RADIUS profiles, hotspot operators, Hotspot 2.0, tags, accounts, channel plans, virtual devices, current user |

### UniFi OS System API (`UniFi.Network.System`)

| Module | Endpoints |
|--------|-----------|
| `UniFi.Network.System` | Console system info (model, name, cloud status, direct connect domain) |

## Scripts

### Official API

| Script | What it does |
|--------|-------------|
| `get_info.exs` | Application version |
| `list_sites.exs` | Local sites |
| `list_clients.exs` | Connected clients + first client details |
| `list_adopted_devices.exs` | Adopted devices + details + live statistics |
| `list_pending_devices.exs` | Devices pending adoption |
| `list_networks.exs` | Networks + details + references |
| `list_wifi_broadcasts.exs` | WiFi SSIDs + details |
| `list_wans.exs` | WAN interfaces |
| `list_firewall_zones.exs` | Firewall zones |
| `list_firewall_policies.exs` | Firewall policies + ordering |
| `list_acl_rules.exs` | ACL rules + ordering |
| `list_dns_policies.exs` | DNS policies |
| `list_traffic_matching.exs` | Traffic matching lists |
| `list_hotspot_vouchers.exs` | Hotspot vouchers |
| `list_vpn_servers.exs` | VPN servers |
| `list_vpn_tunnels.exs` | Site-to-site VPN tunnels |
| `list_radius_profiles.exs` | RADIUS profiles |
| `list_device_tags.exs` | Device tags |
| `list_countries.exs` | Country list |
| `list_dpi_categories.exs` | DPI application categories |
| `list_dpi_applications.exs` | DPI applications |

### Legacy API

| Script | What it does |
|--------|-------------|
| `legacy_sysinfo.exs` | Controller system info (version, build, retention) |
| `legacy_health.exs` | Subsystem health (wlan/wan/lan/vpn) |
| `legacy_devices.exs` | Device stats with uptime and load |
| `legacy_clients.exs` | Client stats with signal, satisfaction, SSID |
| `legacy_rogue_aps.exs` | Detected rogue/neighbor access points |
| `legacy_events.exs` | System events |
| `legacy_alarms.exs` | System alarms |
| `legacy_dpi.exs` | DPI traffic statistics |
| `legacy_channels.exs` | Current channel usage |
| `legacy_spectrum.exs` | Spectrum scan results |
| `legacy_settings.exs` | All settings keys |
| `legacy_port_forwards.exs` | Port forwarding rules |
| `legacy_routing.exs` | Static routes + routing stats |
| `legacy_firewall_rules.exs` | Legacy firewall rules + groups |
| `legacy_known_users.exs` | All known users (historical) + groups |
| `legacy_wlan_conf.exs` | WLAN configurations |
| `legacy_network_conf.exs` | Network configurations |
| `legacy_misc.exs` | Port profiles, DDNS, RADIUS, hotspot, tags, self |
| `system_info.exs` | UniFi OS console info |

## License

MIT

