# League of Legends for XE

This folder contains a first-pass Xeneon Edge widget scaffold for League of Legends.

## Current state

- The widget is a standalone XE HTML widget file named `League of Legends for XE`.
- The intended default is `personal-use direct mode`: the user enters their own Riot API key locally inside the widget setup.
- The key is stored in local widget storage on that machine and is not bundled into the widget source.
- The file still supports an optional proxy fallback if direct Riot requests fail in the XE runtime.
- Without live configuration, it renders a mock dataset so layout and interaction can be tested immediately.

## Direct local mode

The expected flow for this widget is:

`XE widget -> Riot API`

The user enters:

- Riot API key
- Riot ID game name
- Riot ID tag line
- Region

This is aimed at people using the widget personally on their own Xeneon Edge.

## Optional proxy fallback

If Riot requests from the widget are blocked by browser/runtime restrictions, the widget can still use:

`XE widget -> small proxy/backend -> Riot API`

The optional proxy route is:

`GET /lol/summary?region=REGION&gameName=NAME&tagLine=TAG`

## Local testing without hardware

You can test the widget in a normal browser before the Xeneon Edge arrives.

Run:

```powershell
.\league-XE-Widget\test-locally.ps1
```

Then open:

`http://localhost:8000/league-XE-Widget/League%20of%20Legends%20for%20XE.html`

For Xeneon import/use, keep using the extensionless file:

`League of Legends for XE`

The `.html` copy exists only so a normal browser serves it as HTML during local preview.

In browser mode, the widget exposes a small `Browser Test Mode` panel that simulates the iCUE properties such as:

- preferred queue
- refresh interval
- live panel visibility
- recent strip visibility
- text, accent, and background colors
- transparency

Use `Widget Setup` or `Open Setup` to test:

- mock preview mode
- direct Riot API mode with your own key
- optional proxy fallback mode

Example response shape:

```json
{
  "profile": {
    "gameName": "Aether Fang",
    "tagLine": "NA1",
    "region": "NA1",
    "role": "Mid",
    "winRate": 58,
    "last10": "7-3",
    "focus": "Ranked Solo climb",
    "rankTier": "Emerald II",
    "leaguePoints": 64,
    "wins": 41,
    "losses": 30,
    "queue": "Solo/Duo",
    "avgKda": "4.1",
    "status": "live"
  },
  "liveMatch": {
    "available": true,
    "statusText": "In Game",
    "headline": "Control mage online",
    "subtitle": "Live data from proxy",
    "gameTime": "28:14",
    "phase": "In Progress",
    "queueName": "Ranked Solo / Summoner's Rift",
    "blueKills": 18,
    "redKills": 14,
    "dragons": "3 - 1",
    "towers": "7 - 4",
    "gold": "54k - 49k",
    "role": "Mid / Carry",
    "champion": "Ahri",
    "kda": "7 / 2 / 6",
    "cs": "211",
    "vision": "28",
    "damage": "24k",
    "impact": "72%",
    "participation": "72%",
    "nextObjective": "Baron 1:12",
    "powerSpike": "2 items"
  },
  "recentMatches": [],
  "championPool": []
}
```

## Next recommended step

1. Test the widget inside the actual XE runtime with a personal Riot API key.
2. Confirm whether direct Riot requests succeed from that environment.
3. If direct requests fail because of browser/runtime restrictions, add the tiny proxy fallback endpoint.
