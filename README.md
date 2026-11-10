# ert11er Community App Store

A small Umbrel Community App Store. Add this repository's URL in the umbrelOS
App Store settings to install the apps below.

## Apps

### OmniRoute

[OmniRoute](https://www.omniroute.online/) is a self-hosted AI gateway that puts
380+ cloud and local providers behind one OpenAI-compatible endpoint, with
automatic fallback, routing strategies, quota tracking, and usage analytics.

- App ID: `ert11er-omniroute`
- Upstream version: `3.8.53`
- Opens at: `http://umbrel.local:20128`
- RAM: 2 GB minimum, 4 GB recommended, 8 GB+ for heavy coding agents

The package runs the pinned `diegosouzapw/omniroute:3.8.53-web` image plus the
upstream `redis:8.6.5-alpine` sidecar. The dashboard password is generated per
install and shown in Umbrel, and the `/v1` API requires an API key created in
the dashboard.

### NetBird

[NetBird](https://netbird.io/) builds a private WireGuard mesh between your devices
and servers. Peers connect directly when the network allows it and fall back to a
relay when it does not, so you can reach remote machines without opening a port per
service.

- App ID: `ert11er-netbird`
- Upstream version: `0.82.1`
- Opens at: `http://umbrel.local:20347`
- RAM: 1 GB minimum, 2 GB recommended

This package runs the all-in-one NetBird server (management, signal, relay, STUN
and the embedded Dex identity provider) together with the web dashboard, behind a
small Caddy front proxy on a single port.

- **Plain HTTP is intentional**: NetBird peers speak gRPC (HTTP/2) to the server,
  and Umbrel's HTTPS ingress only forwards HTTP/1.1. The dashboard and API are
  reachable at `http://umbrel.local:20347`.
- **First-run setup**: The setup page is only available while no user exists, so
  create the admin account right after installing via `http://umbrel.local:20347/setup`.
- **Peer connectivity**: If `.local` names do not resolve on a device, pass the
  Umbrel's IP address to `netbird up --management-url` instead.
- **STUN and relay**: STUN listens on UDP 3478 and the server on TCP 20347. Forward
  both on your router if peers outside your LAN should connect directly or use the
  relay.
- **Data persistence**: Users, peers, keys and settings are stored in the app's data
  directory.

---

```text
umbrel-app-store.yml        # store metadata
ert11er-omniroute/
  umbrel-app.yml            # app manifest
  docker-compose.yml        # app deployment
  data/                     # committed bind-mount scaffolding
ert11er-netbird/
  umbrel-app.yml            # app manifest
  docker-compose.yml        # app deployment
  Caddyfile               # reverse proxy config
  config.yaml.template    # NetBird config template
  exports.sh              # key derivation + relay secret
  data/                     # committed bind-mount scaffolding
```
