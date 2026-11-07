# Inspeecto88 — мої налаштування Claude Code

Спільні налаштування для всіх пристроїв (телефон, MacBook, ПК, хмарні сесії).

| Що | Де | Статус |
|---|---|---|
| Claude Code Setup (офіційний Anthropic) | `.claude/settings.json` | вмикається автоматично |
| Claude-Mem (пам'ять між сесіями, на моєму плані) | `.claude/settings.json` | вмикається автоматично |
| Task Observer (покращення скілів) | `.claude/skills/task-observer/` + `CLAUDE.md` + хук | активний, огляд раз на тиждень |
| Скіли контенту: `tiktok-script`, `social-post`, `kling-prompt` | `.claude/skills/` | готові |
| Headroom, OmniRoute | `docs/proxies-local.md` | не встановлені, інструкція на потім |

## Як користуватися
- «Напиши сценарій TikTok про …» — скіл `tiktok-script`.
- «Зроби карусель для Instagram про …» / «пост у Telegram про …» — `social-post`.
- «Промпт для Kling: …» — `kling-prompt`.
- «Порадь автоматизації для цього проєкту» — плагін Claude Code Setup.
- «Зроби огляд спостережень» — Task Observer покаже пропоновані покращення скілів.

## На своєму комп'ютері
1. `git clone https://github.com/inspeecto88/inspeecto88` і запускай `claude` у цій папці.
2. Перший запуск спитає, чи довіряти папці й чи встановити плагіни з маркетплейсів — погодься.
3. Claude-Mem потребує Node.js 18+ (його фоновий процес запускається сам).

Task Observer: CC BY 4.0, Eoghan Henn and contributors — https://github.com/rebelytics/one-skill-to-rule-them-all
