# skill-only package

This folder is a lightweight distribution pack for agent skill installation.

Contents:
- `plugins/audio-srt-skills/`: Claude/OpenClaw plugin package
- `plugins/audio-srt-skills/skills/audio-srt-workflow/`: standalone Agent Skill

## Codex install target

Recommended lightweight branch URL:

```text
https://github.com/Sariel2018/audio-srt-aligner/tree/skill-only/plugins/audio-srt-skills/skills/audio-srt-workflow
```

Alternative URL from `main` branch path:

```text
https://github.com/Sariel2018/audio-srt-aligner/tree/main/skill-only/plugins/audio-srt-skills/skills/audio-srt-workflow
```

In the `main` branch tree, this path is:

- `skill-only/plugins/audio-srt-skills/skills/audio-srt-workflow`

Both URLs above were verified on March 31, 2026 with Codex skill installer.

## Claude marketplace plugin source

The root `.claude-plugin/marketplace.json` points to:

- `./skill-only/plugins/audio-srt-skills`

This avoids shipping repository-wide sample files into installed plugin payloads.

## ClawHub publish (OpenClaw)

```bash
npm i -g clawhub
clawhub login
clawhub publish ./skill-only/plugins/audio-srt-skills/skills/audio-srt-workflow \
  --slug audio-srt-workflow \
  --name "Audio SRT Workflow" \
  --version 0.1.0 \
  --tags latest
```
