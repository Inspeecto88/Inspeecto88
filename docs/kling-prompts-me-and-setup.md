# Kling — промпти: я і моя кімната

Версія 2026-11-10. Зроблено з моїх фото (опис також у `CLAUDE.md`, розділ «Мій вигляд і сетап»).
Промпти англійською, бо Kling краще розуміє англійську. Під кожним промптом — пояснення українською.

Важливо: текстовий промпт дає схожий типаж і той самий сетап, але не твоє точне обличчя.
Для точного збігу обличчя потрібен Element (2-4 твої фото, завантажені в Kling).

## 1. Блоки, які вставляються в кожен промпт

Копіюй блоки дослівно в кожну сцену — так персонаж і кімната не «пливуть» між кліпами.

**[HERO] — персонаж**
```
a man in his mid-20s with short dark hair, neatly trimmed short dark beard and light eyes, calm confident expression, wearing white over-ear gaming headphones with a black boom microphone, a grey-olive zip-up track jacket with thin white vertical pinstripes and a white fleece lining, over a black t-shirt
```
Українською: чоловік близько 25 років, коротке темне волосся, коротка охайна борода, світлі очі,
білі навушники з чорним мікрофоном, сіро-оливкова куртка в тонку білу смужку з білою підкладкою, чорна футболка.

**[ROOM] — кімната**
```
a cozy gaming room bathed in deep violet LED light, a glowing LED strip along the ceiling edge, heavy purple velvet curtains, purple walls, dark and moody atmosphere
```
Українською: кімната у глибокому фіолетовому світлі, LED-стрічка по краю стелі, важкі фіолетові штори, фіолетові стіни.

**[DESK] — стіл і техніка**
```
a white gaming desk with a large black desk mat patterned with glowing blue hexagons, a low-profile RGB mechanical keyboard, two monitors side by side, one of them curved, a silver laptop on the left, a white ergonomic mesh chair with a headrest
```
Українською: білий стіл, чорний килимок із синіми шестикутниками, низька RGB-клавіатура, два монітори
(один вигнутий), сріблястий ноутбук ліворуч, біле ергономічне сітчасте крісло з підголівником.

**[PC] — комп'ютер**
```
a white glass-panel PC case with bright white fans and a white tower CPU cooler, a large graphics card inside, small white anime figurines next to the case, two game controllers on top
```
Українською: білий корпус зі склом, білі вентилятори з підсвіткою, білий баштовий кулер, велика відеокарта,
білі аніме-фігурки поруч, два геймпади зверху.

**[LIGHT] — світло (фірмова гама)**
```
deep violet ambient light, cool blue accent light from the monitors, soft white key light on the face, cinematic, photorealistic, shallow depth of field
```
Українською: фіолетове загальне світло, синій акцент від моніторів, м'яке біле світло на обличчя, кіно, фотореалізм.

**Negative prompt (завжди)**
```
blurry, distorted hands, extra fingers, deformed face, text, letters, watermark, logo, brand names, cartoon, oversaturated skin, purple-tinted skin
```

## 2. Картинки (text-to-image) — 4 базові кадри

Параметри: модель kling-image-v3_0, 9:16, 1k для пробних, 2k для фінальних, по 4 варіанти.

| № | Кадр | Промпт (вставляєш блоки) | Для чого |
|---|---|---|---|
| 1 | Я за столом, обличчям до камери | `[HERO] sitting at [DESK] in [ROOM], facing the camera with a slight confident smile, medium close-up, eye level, [LIGHT], vertical 9:16` | Хук «говоряча голова», обкладинка |
| 2 | Я в профіль біля монітора | `[HERO] leaning toward the monitor with focused eyes, side profile, hand on the keyboard, in [ROOM], monitor glow on his face, medium shot, [LIGHT], vertical 9:16` | Кадр «напружений драфт» |
| 3 | Загальний план сетапу | `[DESK] and [PC] in [ROOM], empty chair, wide shot from behind and slightly to the side, monitors glowing, [LIGHT], vertical 9:16` | Вступ YouTube, переходи |
| 4 | Макро клавіатури | `extreme close-up of a finger pressing a key on a low-profile RGB mechanical keyboard lying on a black desk mat with glowing blue hexagons, violet ambient light, macro shot, crisp detail, vertical 9:16` | Вставка «F8» |

## 3. Відео (image-to-video) — оживлення кадрів

Параметри: модель kling-video-v3_0_turbo, 5 с, 720p для пробних / 1080p для фіналу.
Для image-to-video описуємо тільки рух — все інше вже є на картинці.

| № | З якого кадру | Промпт руху | Тривалість |
|---|---|---|---|
| 1 | Кадр 1 | `He looks up from the monitor straight into the camera, raises one eyebrow and gives a short confident nod, then stays still. Camera: slow dolly-in, then stops. Violet light, monitor glow flickers softly.` | 5 с |
| 2 | Кадр 2 | `He narrows his eyes at the screen, then presses a key firmly, the keyboard backlight pulses brighter, then he freezes, focused. Camera: static. Monitor light flickers on his face.` | 5 с |
| 3 | Кадр 3 | `Slow cinematic glide across the desk toward the glowing PC case, white fans spinning, LED strip glowing on the ceiling, then the camera stops. No people.` | 5 с |
| 4 | Кадр 4 | `The finger presses the key down, the RGB backlight flashes from violet to bright white, then settles back. Camera: static macro.` | 5 с |

Українською: 1 — ти піднімаєш погляд у камеру і киваєш, наїзд камери; 2 — натискаєш клавішу, підсвітка спалахує;
3 — повільний проліт камери по столу до ПК; 4 — палець тисне клавішу, підсвітка спалахує і повертається.

## 4. Готовий повний промпт (приклад кадру 1, зібраний)

```
A man in his mid-20s with short dark hair, neatly trimmed short dark beard and light eyes, calm confident expression, wearing white over-ear gaming headphones with a black boom microphone, a grey-olive zip-up track jacket with thin white vertical pinstripes and a white fleece lining, over a black t-shirt, sitting at a white gaming desk with a large black desk mat patterned with glowing blue hexagons, a low-profile RGB mechanical keyboard, two monitors side by side, in a cozy gaming room bathed in deep violet LED light, a glowing LED strip along the ceiling edge, heavy purple velvet curtains, facing the camera with a slight confident smile, medium close-up, eye level, deep violet ambient light, cool blue accent light from the monitors, soft white key light on the face, cinematic, photorealistic, shallow depth of field, vertical 9:16
```

## 5. Вартість (з нашого акаунта)

| Що | Кредитів |
|---|---|
| 4 картинки, 1k | 4 |
| Відео 5 с, 720p, 3.0 Turbo | 40 |
| Повний набір: 4 кадри x 4 варіанти + 4 відео | ~176 |
