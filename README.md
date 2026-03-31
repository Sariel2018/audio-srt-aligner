# skill-only package

This folder is a lightweight distribution pack for agent skill installation.

Contents:
- `plugins/audio-srt-skills/`: Claude/OpenClaw plugin package
- `plugins/audio-srt-skills/skills/audio-srt-workflow/`: standalone Agent Skill

## Codex install target

Use this path in installer URLs:

- `skill-only/plugins/audio-srt-skills/skills/audio-srt-workflow`

## Claude marketplace plugin source

The root `.claude-plugin/marketplace.json` points to:

- `./skill-only/plugins/audio-srt-skills`

This avoids shipping repository-wide sample files into installed plugin payloads.
