# Headroom і OmniRoute — інструкція на потім (MacBook / ПК)

Обидва інструменти — це локальні проксі між Claude Code і моделлю. Вони працюють тільки на
комп'ютері, де запущений Claude Code у терміналі. У хмарних сесіях (claude.ai/code) і на
телефоні вони не працюють.

Для контенту й навчання вони зараз не потрібні. Ставити варто, якщо:
- **Headroom** — ти почав працювати з кодом і в контекст часто потрапляють великі логи чи файли.
- **OmniRoute** — ти регулярно впираєшся в ліміти Claude і готовий працювати на інших моделях.

Не ставь обидва одразу: це два проксі в одному ланцюжку, їх доведеться узгоджувати.

---

## Headroom (стискання контексту)

Репозиторій: https://github.com/headroomlabs-ai/headroom

Потрібно: Python 3.11+ і `uv` (macOS: `brew install uv`; Windows: `winget install astral-sh.uv`).

```bash
uv tool install --python 3.13 "headroom-ai[all]"
headroom wrap claude          # запускає Claude Code через локальний проксі Headroom
headroom dashboard            # скільки токенів зекономлено (поки проксі працює)
```

- `headroom wrap claude` працює тільки на одну сесію: проксі закривається разом з Claude Code.
- Він також реєструє MCP-сервер Serena для проєкту. Щоб без нього: `headroom wrap claude --code-memory none`.
- Відкотити все: `headroom unwrap claude`.
- Ризик: стискання з втратами. Якщо Claude «не бачить» деталі в логах, запусти сесію без Headroom.

---

## OmniRoute (перемикання моделей при ліміті)

Репозиторій: https://github.com/diegosouzapw/OmniRoute

Потрібно: Node.js 20+.

```bash
npm install -g omniroute
omniroute                     # шлюз + панель на http://localhost:20128
```

1. Відкрий http://localhost:20128 і підключи провайдерів (свої акаунти або API-ключі).
2. Запусти Claude Code через нього: `omniroute run claude --model <провайдер/модель>`
   (або `omniroute configure`, щоб налаштувати інтерактивно).

Перед використанням:
- Інші моделі (GLM, Gemini, Kimi) у Claude Code працюють гірше за Claude, особливо з інструментами.
- Безкоштовні провайдери можуть використовувати твої дані для навчання. Приватні тексти,
  клієнтські дані й ключі через них не проганяй.
- Деякі провайдери забороняють сторонніх клієнтів в умовах користування. OmniRoute позначає їх
  `tos: avoid` і не використовує автоматично — не вмикай їх вручну.
