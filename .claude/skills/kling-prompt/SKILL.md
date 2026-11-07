---
name: kling-prompt
description: Складає промпти для генерації відео й зображень у Kling AI (text-to-video, image-to-video, image) для контенту в TikTok/Reels/Instagram — сцена, камера, світло, рух, стиль, формат 9:16. Use when the user wants a Kling prompt, wants to animate an image, or plans AI-video scenes for a short video.
version: 1
---

# Промпт для Kling

## Що спитати (тільки якщо не сказано)
- Що генеруємо: відео з тексту, відео з картинки, зображення.
- Формат: за замовчуванням 9:16 (вертикаль), 5 с.
- Стиль: реалізм, кіно, 3D, аніме, продуктова зйомка.

## Формула промпту (англійською — Kling краще розуміє)
`[суб'єкт + дія] , [середовище] , [камера: план + рух] , [світло] , [стиль / настрій] , [деталі якості]`

Приклад:
`A young woman unboxing a matte black phone at a wooden desk, cozy home office, close-up, slow dolly-in, soft window light, warm cinematic look, shallow depth of field, 9:16`

## Що віддати
1. Промпт англійською (1-3 речення).
2. Переклад-пояснення українською одним рядком.
3. Negative prompt, якщо доречно (`blurry, distorted hands, text, watermark`).
4. Параметри: формат, тривалість, модель (якщо користувач вказав).
5. Для серії сцен — таблиця `сцена | промпт | тривалість`, з однаковим описом персонажа в кожній сцені.

## Правила
- Одна дія камери на сцену; не змішуй кілька рухів.
- Для image-to-video описуй рух, а не те, що вже є на картинці.
- Генерація в Kling платна: не запускай її через MCP без явної згоди користувача.
- Для глибшої роботи з Kling є скіли `kling-ai-prompt-generator:kling-ai` і `kling-ai:kling-ai-generate-video`.
