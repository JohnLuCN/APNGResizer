@echo off
set "size=520x520"
set /p size="ResizeTo(default: 520x520): "
mkdir tmp
mkdir %size%
for %%i in (*.png) do (
magick apng:%%i -transparent #000000 -resize %size% tmp\%%~ni-test.png
ffmpeg -r 7 -start_number 0 -i "tmp\%%~ni-test-%%d.png" -plays 0 tmp\%%~ni.apng
rename tmp\%%~ni.apng %%~ni.png
move /Y tmp\%%~ni.png %size%
)
del /Q tmp 