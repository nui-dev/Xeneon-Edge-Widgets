# Valorant Dashboard

A Xeneon Edge iCUE widget that surfaces your Valorant account summary, most recent match, and recent history using the official Riot Games API.

## What it shows

- **Topbar** — Riot ID, region, account level, total matches, win rate, last played, rank tier, and session state
- **Live Match panel** — score, agent, KDA, headshot %, first bloods, plants, defuses and key stats of your most recent completed match
- **Recent Matches panel** — your last five results with agent, map, mode, KDA and time ago
- **Agent Pool panel** — your most played agents with win rate and games played
- **Momentum Strip** (footer) — quick win/loss chips for your last five matches

## Setup

1. Get a **Riot API key**: go to https://developer.riotgames.com, sign in with your Riot account, and copy the **Development API Key** at the top of the dashboard. Important: development keys **expire every 24 hours** — you will need to refresh the key daily, or apply for a Personal API Key (longer-lived) via the "Register Product" flow.
2. Find your **Riot ID**: open Valorant or your Riot account page — your Riot ID is in the format `GameName#TagLine` (e.g. `ShadowFox#NA1`). Copy the GameName and TagLine separately.
3. Pick your **region**: `na` (Americas), `eu` (Europe), `ap` (Asia-Pacific), `kr` (Korea), `latam`, or `br`.
4. Open the widget settings inside iCUE, click **Setup**, paste your API key, GameName, TagLine and region, then click **Save & Load**.
5. If the widget shows an error or the live data will not load, click **Use Mock Preview** to verify the layout — see the CORS section below for context.

## CORS / proxy fallback

Riot's API does not allow direct browser requests in most environments due to CORS. You have two options:

1. **Mock Preview mode** — works offline, no setup needed, shows sample data.
2. **Proxy server** — run a small backend that forwards requests to Riot. The widget expects the route:
   ```
   GET {proxyBaseUrl}/val/summary?region=REGION&gameName=NAME&tagLine=TAG
   ```
   Paste the proxy base URL into the optional **Proxy Base URL** field in the setup modal. A reference proxy implementation is out of scope for this widget — any small Node or Python server that injects your Riot key and forwards to `*.api.riotgames.com` will work.

## Data source

Powered by the [Riot Games API](https://developer.riotgames.com) (`account-v1` + `val-match-v1`) and the community [valorant-api.com](https://valorant-api.com) for agent portraits. This widget is not endorsed by or affiliated with Riot Games.

## Refresh interval

Defaults to every 2 minutes. Configurable from 1–15 minutes via the iCUE settings panel.

## Limitations

- Valorant has no public live-match endpoint, so the "Live Match" panel shows your most recent completed match instead.
- Headshot %, MVP, first bloods, plants and defuses display `--` in live mode (deeper match parsing is not implemented in v1).
- Development API keys expire every 24 hours — refresh from the Riot developer portal.

## Privacy

Your Riot API key is stored only in local widget storage on your machine. Never commit it or share it. No telemetry is sent.
