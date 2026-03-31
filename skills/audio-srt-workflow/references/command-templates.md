# Command Templates

## Install Dependencies

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Mode A (Audio + Transcript)

```bash
python3 align_to_srt.py \
  --audio "input.wav" \
  --text "transcript.txt" \
  --output "output.srt" \
  --model small \
  --language zh
```

## Mode A With Date Suffix

```bash
python3 align_to_srt.py \
  --audio "input.wav" \
  --text "transcript.txt" \
  --output "output.srt" \
  --date-suffix
```

## Mode B (Audio Only, GUI)

```bash
python3 gui_app.py
```

## Quality Check

```bash
python3 srt_stats.py --srt "output.srt"
python3 srt_stats.py --srt "output.srt" --warn-duration 8 --warn-gap 0.8
```

## Preview Video

```bash
python3 make_preview_mp4.py \
  --audio "input.wav" \
  --srt "output.srt" \
  --output "preview_check.mp4"
```
