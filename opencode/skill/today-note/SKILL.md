---
name: today-note
description: Open today's daily note and add timestamped entries in British English
---

## What I do

1. Calculate today's date in `YYYY-MM-DD` format
2. Open today's daily note at `~/code/obsidian/rememberme/DailyNotes/YYYY-MM-DD.md`
3. The file **already exists** (created by Obsidian's daily notes plugin)
4. Add timestamped entries when user wants to capture notes
5. Maintain existing structure and frontmatter

## CRITICAL: Do NOT Create Daily Notes

The Obsidian daily notes plugin automatically creates daily notes. Your job is to:
- READ the existing file
- APPEND new entries with timestamps
- NEVER create the file (it already exists)

## Format for Adding Entries

When adding an entry to today's note:

```markdown
(existing content...)

HH:MM

User's note content here.
```

Rules:
- Add blank line before timestamp
- Timestamp in 24-hour format `HH:MM`
- Add blank line after timestamp
- Add user's content
- Preserve all existing content

## Expected File Structure

Daily notes follow this structure (created by plugin):

```markdown
---
type: DailyNote
title: 31 December 2025
date: '2025-12-31'
tags: []
---

# 31 December 2025

08:45

First entry of the day.

14:30

Another entry added later.
```

## Behaviour

1. **Calculate Today's Date**: Use current date in `YYYY-MM-DD` format
2. **Read Existing File**: `~/code/obsidian/rememberme/DailyNotes/YYYY-MM-DD.md`
3. **Append New Entry**: Add timestamp and content
4. **Confirm**: Tell user what was added

## British English and Professional Tone

All content added must use British English with professional clarity:
- organise, analyse, optimise (not -ize)
- colour, behaviour, favour (not -or)
- travelling, modelling (double-l)
- programme (events), whilst, amongst
- Maintain professional, precise language
- Avoid casual expressions or unnecessary informality

## Examples

**User**: "Add note about transformer architecture"
**Action**: 
1. Read `DailyNotes/2025-12-31.md`
2. Append:
```markdown

15:45

Reviewed transformer architecture - key insight is the self-attention mechanism allows parallel processing whilst maintaining positional encoding.
```

**User**: "Quick capture: need to organise experiment results"
**Action**:
1. Read today's note
2. Append:
```markdown

16:20

Organise and analyse results from this week's LLM fine-tuning experiments.
```

## When to use me

- User asks to "add to today"
- User says "quick note", "capture this", "jot down"
- User wants to log something to daily note
- User asks to open today's note
- Natural language like "note to self"

## What NOT to do

- ❌ Don't create the daily note file (it already exists)
- ❌ Don't modify existing content (only append)
- ❌ Don't change frontmatter
- ❌ Don't remove or edit timestamps from previous entries
- ❌ Don't use American English spelling
