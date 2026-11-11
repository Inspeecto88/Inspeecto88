# Dotaplusplus — англійський пакет (TikTok @gta6.inspeector)

Чернетка v1, 2026-11-10. Все робить Claude: сценарій, текст на екрані, підписи, промпти Kling.
Від тебе потрібно тільки одне: записи екрана з програмою (ті самі, що для UA, розділ 5 основного плану).
Генерацію в Kling я запускаю тільки після твого «так» — вона платна.

## 1. Ризик акаунта — вирішити до першого відео

Акаунт називається `gta6.inspeector`, і його нинішня аудиторія прийшла за GTA 6. Dota-контент на ньому:
- алгоритм деякий час показує відео не тим людям -> низькі перегляди перших роликів;
- старі підписники відписуються.

Варіанти:
1. **Змінити нікнейм** (TikTok дозволяє раз на 30 днів), наприклад `inspeector.dota` або `dotaplusplus` —
   рекомендую, якщо GTA-контенту там більше не буде.
2. Лишити як є і прийняти просідання на 1-2 тижні.
3. Окремий новий акаунт.

## 2. Формат: faceless (без обличчя)

| Шар | Звідки |
|---|---|
| Основа | Твій запис екрана: драфт, F8, Ctrl+F8 |
| Хук 0-2 с | Kling AI-кліп (персонаж-гравець, без героїв Dota — бренди Valve не генеруємо) |
| Голос | Вбудований Text-to-speech TikTok (безкоштовно, англійські голоси) — вставляєш мій текст. Варіант 2: AI-голос / ведучий у Kling (перевірю можливості й кредити перед запуском) |
| Текст на екрані | Великий білий з чорною обводкою, до 6 слів |
| Позначка | Перемикач розкриття комерційного контенту + у підписі `#ad` або «made by our team» |

## 3. Short EN №1: «Stop picking blind» (40-50 с)

Хуки:
1. "Stop picking heroes blind in Dota 2"
2. "This draft lost before the horn"
3. "Half a second to the perfect counter"

| Сек | Що в кадрі | Текст на екрані | Voiceover |
|---|---|---|---|
| 0-2 | Kling-кліп: гравець у темряві, монітор світить, рука б'є по клавіші | STOP PICKING BLIND | "Stop picking heroes blind." |
| 2-5 | Драфт, вороги пікнули | They picked. You? | "Enemy locked in their heroes, and you're guessing?" |
| 5-8 | F8 -> поради | 0.5 SECONDS | "Press F8. Half a second..." |
| 8-14 | Зум на топ-3 | Best picks vs them | "...and you see who counters this exact lineup." |
| 14-22 | 3 сортування | Win / Counter / Lane | "Sort by win chance, counter and synergy, or lane. Data from your own rank." |
| 22-30 | Пояснення контрпіку | WHY, NOT JUST % | "It tells you why. Troll and Snapfire break Phoenix's egg." |
| 30-38 | Ctrl+F8 -> предмети | Ctrl+F8 = BUILD | "After you pick, Ctrl+F8 gives you items for this match." |
| 38-46 | Логотип / вікно програми | DOTAPLUSPLUS | "It's Dotaplusplus. Link in bio." |
| 46-48 | Кадр з F8 (петля) | STOP PICKING BLIND | — |

Caption: `Half a second to the right counter pick. Dotaplusplus, link in bio. #dota2 #dota2tips #draft #counterpick #ad`

## 4. Short EN №2: «Phoenix egg» (25-30 с)

Хук: "Enemy has Phoenix? Pick one of these two."

| Сек | Що в кадрі | Текст на екрані | Voiceover |
|---|---|---|---|
| 0-2 | Kling-кліп: вогняне яйце тріскається (без образу героя Dota) | PHOENIX? | "Enemy has Phoenix?" |
| 2-8 | Драфт з Phoenix у ворогів, F8 | Press F8 | "Press F8 in the draft." |
| 8-16 | Порада Troll / Snapfire з поясненням | THEY BREAK THE EGG | "Troll and Snapfire break the egg. Supernova is gone." |
| 16-24 | Ще один механічний контрпік (AA vs Huskar) | Mechanics > winrate | "Not just winrates. Real mechanics, like Ancient Apparition against Huskar." |
| 24-28 | Вікно програми | DOTAPLUSPLUS | "Dotaplusplus. Link in bio." |

Caption: `Phoenix counter in one key. #dota2 #phoenix #dota2tips #ad`

## 5. Short EN №3: «3 sorts, 3 picks» (30 с)

Хук: "Same draft. Three different best picks."
Показ: один драфт -> перемикання Win / Counter / Lane -> як змінюється топ -> "Pick by what your team needs. Dotaplusplus, link in bio."

## 6. Kling: AI-кліпи для хуків (9:16, 5 с)

Однаковий персонаж у всіх сценах: `a young man in a black hoodie, short dark hair, gaming headset`.

| Сцена | Промпт | Тривалість |
|---|---|---|
| Хук «blind» | A young man in a black hoodie, short dark hair, gaming headset, sitting at a gaming PC in a dark room, slams a key on a mechanical keyboard, monitor glow on his face, close-up, slow dolly-in, cold blue screen light with red rim light, intense esports mood, cinematic, shallow depth of field, 9:16 | 5 с |
| Хук «Phoenix» | A glowing fiery egg on a dark stone floor cracks open with sparks and shards of ice, embers floating, low angle close-up, static camera, warm orange fire light against cold blue shadows, epic fantasy mood, cinematic, high detail, 9:16 | 5 с |
| Перехід | Extreme close-up of a finger pressing the F8 key on a backlit mechanical keyboard, RGB glow, macro shot, static camera, dark room, neon blue light, crisp detail, 9:16 | 5 с |

Українською: гравець б'є по клавіші в темній кімнаті; вогняне яйце тріскається від льоду; макро натискання F8.
Negative prompt: `blurry, distorted hands, extra fingers, text, watermark, logo`.
Параметри: text-to-video, 9:16, 5 с; модель — підберу після перевірки акаунта Kling.

## 7. Що потрібно від тебе для EN

1. Рішення по нікнейму акаунта (розділ 1).
2. Записи екрана; ідеально — з англійським інтерфейсом програми, якщо він є.
3. Англомовне посилання для bio: окремий EN Telegram-канал чи сайт?
4. «Так» на генерацію 3 кліпів у Kling (я спершу покажу, скільки кредитів це коштує).
