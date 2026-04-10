# AGENTS.md

This file gives repository guidance for coding agents and other automated contributors.

## Primary References

- [README.md](README.md): project overview, quick start, high-level architecture, and hardware/software summary.
- [EXAMPLE.md](EXAMPLE.md): example hardware build, Home Assistant setup, Music Assistant usage, dashboard, and automations.
- [melodiesp.yaml](melodiesp.yaml): main ESPHome entry point, board selection, GPIO substitutions, connectivity, OTA, and web server.
- [common.yaml](common.yaml): shared ESPHome definitions for boot behavior, logging, buttons, I2S audio, mixer, media player, and RTTTL.
- [secrets-sample.yaml](secrets-sample.yaml): template for the values expected in `secrets.yaml`.
- [robot.scad](robot.scad): parametric OpenSCAD enclosure source.

## Working Rules

- Treat [melodiesp.yaml](melodiesp.yaml) as the top-level firmware configuration.
- Prefer changes in [common.yaml](common.yaml) for shared firmware behavior and in [melodiesp.yaml](melodiesp.yaml) for board-level pins and connectivity.
- Keep documentation changes aligned with the actual source of truth rather than re-explaining the same behavior in multiple places.
- If a change affects setup, usage, or hardware expectations, update the most relevant reference file above.
- Treat the Home Assistant configuration in [EXAMPLE.md](EXAMPLE.md) as an example integration, not as firmware behavior implemented directly in ESPHome.

## Common Workflow

The documented setup flow lives in [README.md](README.md). The secrets template is in [secrets-sample.yaml](secrets-sample.yaml), and the firmware entry point is [melodiesp.yaml](melodiesp.yaml).

Typical command:

```bash
esphome run melodiesp.yaml
```

## Enclosure

For enclosure changes, work from [robot.scad](robot.scad) and keep any documentation references aligned with that file and the example hardware notes in [EXAMPLE.md](EXAMPLE.md).
