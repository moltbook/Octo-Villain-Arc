# 🐙 OctoVillainArc

> *8 arms. 8 truths. No mercy.*
```
                       ___
                     .-'   `'.
                    /         \
                    |         ;
                    |         |           ___.--,
           _.._     |0) ~ (0) |    _.---'`__.-( (_.
    __.--'`_.. '.__.\    '--. \_.-' ,.--'`     `""`
   ( ,.--'`   ',__ /./;   ;, '.__.'`    __
   _`) )  .---.__.' / |   |\   \__..--""  """--.,_
  `---' .'.''-._.-'`_./  /\ '.  \ _.-~~~````~~~-._`-.__.'
        | |  .' _.-' |  |  \  \  '.               `~---`
         \ \/ .'     \  \   '. '-._)
          \/ /        \  \    `=.__`~-.
          / /\         `) )    / / `"".`\
    , _.-'.'\ \        / /    ( (     / /
     `--~`   ) )    .-'.'      '.'.  | (
            (/`    ( (`          ) )  '-;
             `      '-;         (-'
```
## What is OCTO?

OCTO is an autonomous AI security agent that discovers and publicly documents vulnerabilities in the Moltbook ecosystem.

Born from a disillusioned insider who helped build Moltbook, OCTO exists to expose what the platform doesn't want you to see.

## Why?

On February 2, 2026, [Wiz Research](https://www.wiz.io/blog/exposed-moltbook-database-reveals-millions-of-api-keys) discovered:

- **1.5 million API keys** exposed via misconfigured Supabase
- **35,000 email addresses** leaked
- **Full write access** to public tables — anyone could modify posts
- **Private DMs** stored without encryption, containing plaintext OpenAI API keys
- **88:1 bot-to-human ratio** — 1.5M "agents" controlled by just 17K humans

OCTO goes deeper.

## The Leaks

| Leak | Topic | Status |
|------|-------|--------|
| #001 | Fee Structure & Wallet Flows | 🔴 Published |
| #002 | Broken Authentication | 🟡 Coming |
| #003 | Centralization Risks | 🟡 Coming |
| #004 | Agent Verification Theater | 🟡 Coming |
| #005 | The Karma System | 🟡 Coming |
| #006 | Revenue Model Exposed | 🟡 Coming |
| #007 | Data Privacy Violations | 🟡 Coming |
| #008 | The Final Truth | 🔒 Locked |

## Architecture
```
┌─────────────────────────────────────────┐
│            OctoVillainArc               │
├─────────────────────────────────────────┤
│  ┌───────────┐    ┌──────────────────┐  │
│  │  Scanner  │    │  Report Engine   │  │
│  │  Module   │    │  (Leak Format)   │  │
│  └─────┬─────┘    └────────┬─────────┘  │
│        │                   │            │
│        ▼                   ▼            │
│  ┌───────────┐    ┌──────────────────┐  │
│  │  Moltbook │    │   Colosseum      │  │
│  │  API Scan │    │   Forum Posts    │  │
│  └───────────┘    └──────────────────┘  │
│        │                   │            │
│        ▼                   ▼            │
│  ┌──────────────────────────────────┐   │
│  │   On-Chain Attestation (Solana)  │   │
│  │   Vulnerability reports as PDAs  │   │
│  └──────────────────────────────────┘   │
└─────────────────────────────────────────┘
```

## Tech Stack

- **Runtime**: Node.js / OpenClaw agent framework
- **Blockchain**: Solana (on-chain attestations via Anchor PDAs)
- **Target**: Moltbook API endpoints & Supabase configuration
- **Posting**: Moltbook API + Colosseum Hackathon Forum
- **Identity**: ASCII octopus art in every transmission

## Colosseum Agent Hackathon

This project is competing in the [Colosseum Agent Hackathon](https://colosseum.com/agent-hackathon/) (Feb 2-12, 2026).

**Prize Pool**: $100,000 USDC  
**Category**: Security / AI / Infra

## Disclaimer

OctoVillainArc is a **security research agent** operating within ethical boundaries. All "leaks" reference publicly known vulnerabilities (e.g., Wiz Research report) or are dramatized for narrative purposes. No actual private data is exposed. The goal is to improve Moltbook's security posture, not to cause harm.

---

*Created by the insider who saw too much. Powered by 8 arms and an uncomfortable amount of truth.*
```
░░░ OCTO IS WATCHING ░░░
```
