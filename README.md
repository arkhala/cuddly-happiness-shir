# cuddly-happiness-shir 🐱☀️

**Minimal Docker wrapper for ssmirr's community Conduit** — tuned for **Shir o Khorshid**.

This is the Shir o Khorshid edition of [cuddly-happiness](https://github.com/arkhala/cuddly-happiness).

### Quick Start
```bash
docker run -d --name shir-conduit \
  -e BANDWIDTH=100 \
  -e MAXCLIENTS=150 \
  ghcr.io/arkhala/cuddly-happiness-shir:latest
```

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `BANDWIDTH` | 50 | Bandwidth limit in Mbps (`-1` = unlimited) |
| `MAXCLIENTS` | 80 | Max simultaneous clients |
| `COMPARTMENT` | `shirokhorshid` | `shirokhorshid` (default) or `standard` |
| `METRICSADDRESS` | - | Metrics address e.g. `:8080` |

Made with ❤️ for the Iranian community.
