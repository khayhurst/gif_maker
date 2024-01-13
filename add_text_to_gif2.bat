@echo off

REM Set script parameters
set input_gif=%~1
set start_frame=%~2
set end_frame=%~3
set text=%~4
set text2=%~5
set output_gif=%~6
set border_width=2
set font_size=24
REM default 24

REM Build and run ffmpeg command
ffmpeg -i %input_gif% -vf "[in]drawtext=fontfile=C\\:/Windows/fonts/arial.ttf:text='%text%':fontcolor=white:bordercolor=black:borderw=%border_width%:fontsize=%font_size%:x=(w-text_w)/2:enable='between(n,%start_frame%,%end_frame%)':y=h-th-32,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse, drawtext=fontfile=C\\:/Windows/fonts/arial.ttf:text='%text2%':fontcolor=white:bordercolor=black:borderw=%border_width%:fontsize=%font_size%:x=(w-text_w)/2:enable='between(n,%start_frame%,%end_frame%)':y=h-th-5,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" %output_gif%

REM Check for errors
if errorlevel 1 (
  echo Error adding text to gif.
  exit /b 1
)

echo Text added to gif successfully.
