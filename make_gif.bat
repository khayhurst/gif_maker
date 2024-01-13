@echo off
setlocal

REM Check if FFmpeg is installed
where ffmpeg >nul 2>&1
if %errorlevel% neq 0 (
    echo FFmpeg is not installed or not in PATH.
    echo Please install FFmpeg and try again.
    exit /b
)

REM Check if enough parameters are provided
if "%~4"=="" (
    echo Usage: %0 input_video start_time end_time output_gif
    exit /b
)

REM Set input parameters
set input_video=%1
set start_time=%2
set end_time=%3
set output_gif=%4

REM Create GIF from video snippet
ffmpeg -i "%input_video%" -ss %start_time% -to %end_time% -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" "%output_gif%"

echo GIF creation completed: %output_gif%
