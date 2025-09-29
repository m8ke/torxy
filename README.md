![header.png](docs/header.png)
<br>
Docker container for the [Tor](https://www.torproject.org/about/history) network.

## Getting started

### Docker Compose

```yaml
services:
  torxy:
    image: ghcr.io/m8ke/torxy
    container_name: torxy
    restart: always
    ports:
      - "9050:9050"
      - "9051:9051"
```

```bash
docker compose -f 'docker-compose.yml' up -d
```

## Test connectivity

```bash
curl -x socks5h://0.0.0.0:9050 https://check.torproject.org/api/ip
```
