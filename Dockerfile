FROM python:3.12-alpine3.20

WORKDIR /app

# Use 'apk' to install packages on Alpine Linux
# The 'build-base' package is needed for compiling many Python packages.
RUN apk add --no-cache ffmpeg jq python3-dev build-base

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python3 -m pip check yt-dlp

CMD ["python3", "bot.py"]
