#!/usr/bin/env bash
# Збирає тестове відео Dotaplusplus (9:16, 1080x1920, 30 fps).
# Використання: bash build.sh ua|en
# Вхід: kling/hook.mp4 (ти в сетапі), kling/setup.mp4 (ПК), subs_<lang>.ass
# Слоти screen1..3 — заглушки під твої записи екрана; коли будуть записи,
# поклади їх як rec/screen1.mp4, rec/screen2.mp4, rec/screen3.mp4 — скрипт візьме їх замість заглушок.
set -euo pipefail
cd "$(dirname "$0")"
L="${1:-ua}"
FONT=/usr/share/fonts/opentype/inter/Inter-ExtraBold.otf
FONT2=/usr/share/fonts/opentype/inter/Inter-Bold.otf
mkdir -p build
V="scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,fps=30,setsar=1,format=yuv420p"

# 1. Кліпи Kling: хук 0-3 с, ПК 3-6 с, CTA 26-32 с (хук уповільнений і затемнений)
ffmpeg -loglevel error -y -i kling/hook.mp4  -t 3 -an -vf "$V" build/a_hook.mp4
ffmpeg -loglevel error -y -i kling/setup.mp4 -t 3 -an -vf "$V,eq=saturation=1.15" build/b_setup.mp4
ffmpeg -loglevel error -y -i kling/hook.mp4  -an -vf "setpts=1.2*PTS,$V,eq=brightness=-0.12" -t 6 build/f_cta.mp4

# 2. Слоти під записи екрана (або заглушка з підписом, що туди ставити)
slot () { # name duration line1 line2
  if [ -f "rec/$1.mp4" ]; then
    ffmpeg -loglevel error -y -i "rec/$1.mp4" -t "$2" -an -vf "$V" "build/$1.mp4"
  else
    ffmpeg -loglevel error -y -f lavfi -i "gradients=s=1080x1920:c0=0x1a0633:c1=0x3b0f6e:x0=0:y0=0:x1=1080:y1=1920:d=$2:speed=0.02,fps=30" -t "$2" \
      -vf "zoompan=z='min(zoom+0.0006,1.06)':d=1:s=1080x1920:fps=30,
           drawbox=x=90:y=330:w=900:h=700:color=white@0.10:t=fill,
           drawbox=x=90:y=330:w=900:h=700:color=0x8B3DFF@0.9:t=6,
           drawtext=fontfile=$FONT2:text='ЗАПИС ЕКРАНА':fontcolor=0xB98CFF:fontsize=44:x=(w-tw)/2:y=400,
           drawtext=fontfile=$FONT:text='$3':fontcolor=white:fontsize=64:x=(w-tw)/2:y=600,
           drawtext=fontfile=$FONT2:text='$4':fontcolor=white@0.8:fontsize=44:x=(w-tw)/2:y=720,
           format=yuv420p" "build/$1.mp4"
  fi
}
slot screen1 9 'драфт  →  F8' 'поради за 0,5 с'
slot screen2 7 '3 сортування' 'механіка — Troll vs Phoenix'
slot screen3 4 'пік  →  Ctrl+F8' 'предмети під матч'

# 3. Склейка
printf "file 'a_hook.mp4'\nfile 'b_setup.mp4'\nfile 'screen1.mp4'\nfile 'screen2.mp4'\nfile 'screen3.mp4'\nfile 'f_cta.mp4'\n" > build/list.txt
ffmpeg -loglevel error -y -f concat -safe 0 -i build/list.txt -c:v libx264 -preset veryfast -crf 20 build/cut.mp4

# 4. Звук: простий біт 120 BPM + клік на F8 (6 с) і Ctrl+F8 (22 с) + «вжух» на склейках
ffmpeg -loglevel error -y -f lavfi -i "aevalsrc='0.55*sin(2*PI*52*t)*exp(-14*mod(t,0.5)) + 0.08*(random(0)-0.5)*exp(-40*mod(t+0.25,0.5)) + 0.5*sin(2*PI*1800*t)*exp(-60*(t-6))*gte(t,6)*lt(t,6.15) + 0.5*sin(2*PI*1800*t)*exp(-60*(t-22))*gte(t,22)*lt(t,22.15)':s=44100:d=32" \
  -af "afade=t=in:d=0.3,afade=t=out:st=30.5:d=1.5,volume=0.9" build/music.wav

# 5. Субтитри + фінальний рендер
ffmpeg -loglevel error -y -i build/cut.mp4 -i build/music.wav \
  -vf "ass=subs_${L}.ass:fontsdir=/usr/share/fonts/opentype/inter" \
  -c:v libx264 -preset medium -crf 19 -pix_fmt yuv420p -c:a aac -b:a 160k -shortest -movflags +faststart \
  "dotaplusplus_test_${L}.mp4"
echo "done: dotaplusplus_test_${L}.mp4"
