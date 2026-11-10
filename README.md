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

## Layout

```text
umbrel-app-store.yml        # store metadata
ert11er-omniroute/
  umbrel-app.yml            # app manifest
  docker-compose.yml        # app deployment
  data/                     # committed bind-mount scaffolding
```
