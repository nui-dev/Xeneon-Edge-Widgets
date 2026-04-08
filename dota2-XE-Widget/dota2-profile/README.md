# Dota 2 Profile

A Xeneon Edge iCUE widget that surfaces your Dota 2 player profile, recent matches, and hero pool using the free OpenDota public API.

## What it shows

- **Topbar** — player name, region, total games, win rate, last played, MMR estimate, rank tier, and session state
- **Last Match Detail panel** — score, GPM/XPM, last hits/deaths, featured hero, KDA, hero damage, net worth, tower damage, hero healing, duration and result of your most recent match
- **Recent Matches panel** — your last five results with hero, mode, KDA and time ago
- **Hero Pool panel** — your most played heroes with win rate and games played
- **Momentum Strip** (footer) — quick win/loss chips for your last five matches

## Setup

1. Find your **32-bit Dota 2 account ID** (not your SteamID64).
2. Easiest method: go to https://steamid.io, paste your Steam profile URL, and copy the value labeled **steamID3** — it looks like `[U:1:123456789]`. The number after the second colon (e.g. `123456789`) is what you need.
3. Alternative: open your Dota 2 profile on https://www.dotabuff.com or https://www.opendota.com — your account ID is the number in the URL (`dotabuff.com/players/{accountId}` or `opendota.com/players/{accountId}`).
4. Open the widget settings inside iCUE, click **Setup**, paste the account ID, then click **Save & Load**.
5. If you don't have an account ID handy, click **Use Mock Preview** to see the layout populated with sample data.

## Data source

Powered by [OpenDota](https://www.opendota.com), a free public Dota 2 API. No API key is required, no account linking is performed, and your account ID is stored only in local widget storage on your machine.

## Refresh interval

Defaults to every 2 minutes. Configurable from 1–15 minutes via the iCUE settings panel.

## Limitations

- MMR is *estimated* by OpenDota based on your rank tier and recent match distribution; it is not an exact solo MMR reading.
- The "Last Match Detail" panel shows your most recent completed match. Dota's live spectator API is not reliably exposed for casual users, so true live in-game data is not shown.

## Privacy

Your account ID never leaves your machine except to query OpenDota's public endpoints directly from the widget. No telemetry, no third-party proxies, no account linking.
