# novnc

[![Build Status](https://github.com/wavyland/novnc/workflows/CI/badge.svg)](https://github.com/wavyland/novnc/actions?query=workflow%3ACI)

This repository defines a multi-arch Docker image for [noVNC](https://github.com/novnc/noVNC) and [websockify](https://github.com/novnc/websockify).

## Usage

Start noVNC, specifying the port on which it should run the HTTP server and the address of the VNC server:
```shell
docker run --rm -p 6080:6080 ghcr.io/wavyland/novnc 6080 172.17.0.1:5900
```

Then, open noVNC in a browser by navigating to [http://localhost:6080](http://localhost:6080).
