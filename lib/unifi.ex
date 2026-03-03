defmodule UniFi do
  @moduledoc """
  Elixir client for the UniFi Network API.

  The Network API runs locally on UniFi OS consoles (UDM, UDM Pro, etc.)
  and provides endpoints for managing networks, WiFi, firewall, clients, and more.

  ## Setup

  1. Create a local API key on your console under **Settings → System → Admins & Roles → API Keys**.
  2. Set the `UNIFI_LOCAL_API_KEY` environment variable.

  ## Usage

      req = UniFi.Network.client(
        base_url: "https://192.168.1.1/proxy/network/integration",
        api_key: System.fetch_env!("UNIFI_LOCAL_API_KEY"),
        verify: false
      )

      {:ok, %{status: 200, body: %{"data" => sites}}} = UniFi.Network.Sites.list(req)
  """
end
