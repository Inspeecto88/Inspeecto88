# CLAUDE.md — профіль і правила роботи

## Хто я
- Роблю контент і маркетинг, генерую AI-відео. Вчуся працювати з Claude Code.
- Платформи: TikTok / Reels / Shorts, Instagram, Telegram, AI-відео в Kling.
- Працюю з різних пристроїв: телефон, MacBook, ПК, хмарні сесії claude.ai/code.
  Тому все важливе (правила, скіли, спостереження) зберігається в цьому репозиторії.

## Як відповідати
- Завжди українською. Код, команди, назви файлів і технічні терміни залишай як є.
- Коротко і по суті: спершу результат, потім (за потреби) 1-2 речення пояснення.
- Без емодзі — ні у відповідях, ні в текстах, які створюєш, якщо я прямо не попрошу.
- Якщо щось неоднозначно — постав одне коротке уточнююче питання, а не гадай.

## Скіли в цьому репозиторії
- `tiktok-script` — сценарії коротких вертикальних відео (TikTok / Reels / Shorts).
- `social-post` — пости для Instagram і Telegram.
- `kling-prompt` — промпти для генерації відео й зображень у Kling.
- `task-observer` — спостерігає за сесіями і пропонує покращення скілів (див. нижче).

## Мій вигляд і сетап (основа для всього відеоконтенту)
Описано з моїх фото 2026-11-10. Використовуй як базу для сценаріїв, розкадровок і промптів Kling.
- **Я в кадрі:** темне коротке волосся, коротка охайна борода, світлі очі. Білі ігрові навушники
  з мікрофоном, сіро-оливкова куртка на блискавці у тонку білу смужку з білою підкладкою, чорна футболка.
- **Кімната:** вся у фіолетовому світлі — LED-стрічка по стелі, фіолетові штори, фіолетові стіни.
- **Стіл:** білий, великий чорний килимок з синіми шестикутниками, низькопрофільна RGB-клавіатура,
  два монітори (один вигнутий), MacBook поруч, тримач для пляшки з водою.
- **ПК:** білий корпус зі склом, білий кулер FROZN, відеокарта GeForce RTX, білі вентилятори з підсвіткою,
  білі аніме-фігурки біля і всередині корпусу, два геймпади зверху. Поруч штатив з тримачем телефона.
- **Крісло:** біле ергономічне сітчасте з підголівником.
- **Фірмові кольори контенту:** фіолетовий + білий + синій акцент. Текст на екрані — білий
  з фіолетовим акцентом; AI-сцени в Kling — у цій же гамі (фіолетове LED-світло, білі навушники, білий ПК).
- **Як знімати:** найкращий фон — я на фоні фіолетових штор або білого ПК-корпусу; кут, де видно ліжко
  і шафу, не брати. Обличчя від фіолетового світла стає фіолетовим — потрібне м'яке біле світло спереду
  (лампа / кільцева лампа). Фото й відео знімати на штативі: з рук кадри змащені.
- Фото себе в репозиторій не кладу — тільки цей опис.

## Плагіни (вмикаються автоматично через .claude/settings.json)
- `claude-code-setup` (офіційний Anthropic) — на запит «порадь автоматизації для проєкту»
  сканує репозиторій і радить хуки, скіли, субагентів, MCP-сервери. Нічого не змінює сам.
- `claude-mem` — пам'ять між сесіями, працює на моєму плані Claude (без реєстрації в cmem.ai).
  Дані лежать у `~/.claude-mem` на кожному пристрої окремо; у хмарних сесіях вони зникають
  разом з контейнером. Тому все, що має бути спільним для всіх пристроїв, записуй сюди, у CLAUDE.md.
- OmniRoute і Headroom зараз не встановлені — інструкція на потім: `docs/proxies-local.md`.

## Task Observer: правила для цього репозиторію
- Робоча папка (workspace) Task Observer — корінь цього репозиторію (`$REPO_ROOT` нижче =
  абсолютний шлях, який друкує `git rev-parse --show-toplevel`; SessionStart-хук теж його називає).
  Спостереження лежать у `skill-observations/`, пропозиції оновлень — у `skill-updates/`.
- Огляд спостережень — раз на тиждень. Нагадай мені, коли з останнього огляду минуло 7+ днів
  і є відкриті спостереження. Жодних змін у скілах без мого підтвердження.
- Наприкінці сесії, якщо в `skill-observations/` чи `skill-updates/` щось змінилося, закоміть
  ці файли й запуш, бо хмарний контейнер зникне, а з ним і незбережені спостереження.

## task-observer activation block
```text
(task-observer activation block — template of v3.9.0)
Before the first tool call of any session — and before writing or
proposing a plan, not merely before executing one — invoke the
task-observer skill AND execute its Session Start Protocol (storage
check and workspace creation, the starter-set reconciliation when due,
frontmatter scan, review trigger). Loading the skill and running
the protocol are separate steps; a session that loads the file and stops
has activated nothing. Any turn that will involve a tool call counts; do
not classify the session as "too simple" from its opening message.
Copy the protocol's seven `- [ ]` items into your first reply and tick
each as it runs; an item you cannot tick is the step you report.
A step you did not run is reported before the answer, in one line — never
after it, where it reads as a suggestion. If the skill does not resolve on
this turn, say which probe told you so (the skill listing, or the skill
directory on disk), re-check the listing on every later turn that makes a
tool call, and run the protocol the first time it resolves — a "not
installed" verdict holds for one turn. Listed on disk but refused by the
Skill tool ("Unknown skill"): read its SKILL.md directly and run the
protocol; the lookup call rides with that read, never with the refused call.

Select skills on the DECISION the request is about, not on the artefact it
arrived as. Name what the user is deciding, then match the installed skill
descriptions against that — a request handed over as a file to review
still needs the skill whose description names its subject.

After completing each task, list the observation records written this
session in the same turn and report a one-line summary from that listing
(ids and titles, or "none logged" followed by one line per user correction
and per incident in the task, each with why it is not an observation —
one-off, already captured in <skill>; a "none" with no such line is a
claim nobody checked) — never from memory of writing them. This is the activation backstop: it forces a look at the log,
so a session that silently skipped the protocol is discovered at the
first task boundary instead of never.

Loading a skill is not complete until you have queried the observation
log for OPEN observations naming it and read their bodies:
  find "$REPO_ROOT/skill-observations/observation-log" -maxdepth 1 \
    -name '*.md' -exec grep -l -E "^(skill|target_file):.*<skill-name>" {} +
(<skill-name> is the bare name: drop a plugin: prefix, up to the last
colon. A qualified pattern misses every entry filed under the bare name
and reports a clean zero; the bare one matches both spellings. For an
agent definition or instructions file it is the file name, which the
target_file: field carries by any path.)
(Use find, not a bare *.md glob: under zsh an unmatched glob aborts the
whole block, and on an empty log it is unmatched in every session.)
Apply their insights to the current work — meaning: let them change what
you do in THIS task, with the user's consent at the point of use: when one
actually changes what you are about to do, surface it once per session,
at a natural break (never mid-task), in one line with accept / opt-out —
follow it in this task or not — and append the answer to the entry's
`use_evidence:` (SKILL.md, How to Log). An opt-out keeps the entry open;
an unattended run appends `used` without asking; an entry with no
evidence line 30 days after its `date:` is offered with that note.
Editing the skill file, or writing the rule into any
other file a later session reads, is acting on the observation and waits
for the review. See "Log, don't act" in SKILL.md: the test is whether the
action leaves a durable change outside the observation log. Run this at every skill load, however many skills load
in one session. The session-start scan does not cover it: that is a
frontmatter sweep over every observation at session start, this is a
body-level lookup for one skill at the moment its rules are applied.

The converse holds too: the grep, and any checkpoint line recording the
load, run only in the same batch as the Skill invocation, and take the
skill name from a load that has actually happened — never from a list of
skills you built to load. A checkpoint line written without the load is a
false record. Before writing to any file a skill reads at run time (a
state file), load that skill: a state file that describes itself is not a
substitute for the skill that owns it.

Where scripts run, the lookup and its checkpoint line are one command:
  bash "$REPO_ROOT/.claude/skills/task-observer/scripts/skill-load.sh" "$REPO_ROOT" <skill-name>
The Skill invocation and that call are ONE batch — emit them together,
one call per skill loaded, never the call in a later batch. A skill whose
frontmatter sets `disable-model-invocation: true` cannot be loaded by the
Skill tool: emit neither call for it. A Skill call that is refused or
errors gets, in the next call, the same command with
`--correct "<refusal text>"` appended, which records `NOT loaded` under
the false `loaded` line and prints nothing. On a first
run the log does not exist yet (step 1 creates it): the call says so and
exits 0 with no checkpoint line; re-run it once per skill loaded in that
batch after the Workspace creation command.

The task-observer workspace for this project is:
  $REPO_ROOT
It does not exist until the first session creates it: a failed probe whose
parent resolves and is writable is a first run — run Workspace creation,
then re-run the lookup above once per skill loaded in that batch (on the
first batch it finds no log and writes no checkpoint line; that is expected).
Every path the skill uses derives from that root and nothing else:
  $REPO_ROOT/skill-observations/observation-log/   (the log)
  $REPO_ROOT/skill-observations/cross-cutting-principles.md
  $REPO_ROOT/skill-updates/                        (staging root)
  $REPO_ROOT/skill-updates/PENDING.md              (staging manifest)
Never resolve any of them from the current working
directory — a cwd inside an ephemeral checkout (a git worktree, a temporary
clone) is torn down and takes the log with it. Never place the workspace
inside a skills-discovery directory or any path linked into one. If this
environment mints a separate project identity per checkout, or more than
one agent works this project, the pinned path above is the single shared
location; do not derive one per session, tool or project.

The user's repositories live under:
  $REPO_ROOT (this repository is the only project)
the review may check upstream versions
(the root the sibling check sweeps before declaring a skill absent;
observation-families.md, "Skill families and the sibling check").

A subagent dispatched by a session that already runs this protocol does
not run it again and does not write to the log. The controller observes,
because only it sees the whole task and its review; a subagent that
notices something worth logging says so in its final report, and the
controller writes it, running the id snippet per write. A start-up rule
in a project file reaches every agent whose working folder is inside the
project — a subagent, or a session started there. When this session starts
another session (not a subagent), pass it a working folder inside the
project, or the workspace root, so the block is in context from its first
turn; a folder named only in the brief does not load it.
Before briefing a delegate under an agent definition or instructions
file, run the lookup for that file's name with `--query-only` (no load
rides with it, so no `loaded` line); its open entries shape the brief.
A controller that dispatches a specialist outside its own harness puts
one line in the task context — `task-observer: the controller observes;
report observations in your handoff` — because the specialist cannot see
its caller.

A run of this block that cannot write here or get an approval answered —
a child run with no protocol-running caller, a job with a narrow tool
allowlist, a scheduled task in default permission mode — skips the write
steps, never stalls on them, and ends its final message with a
`## Task-observer notes` section (environments.md, "Sessions whose
output channel is owned by a caller"). Such runs write their output to:
  none

An observation file comes into being only through
  bash "$REPO_ROOT/.claude/skills/task-observer/scripts/new-observation.sh" <slug> "$REPO_ROOT"
which prints the path to write into. Never by copying another file's
header or counting a listing — including on the turn after a
compaction, when the skill body is out of context.```
