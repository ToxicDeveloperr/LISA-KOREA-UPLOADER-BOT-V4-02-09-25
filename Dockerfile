FROM python:3.14-rc-alpine3.20

WORKDIR /app

# Use 'apk' instead of 'apt-get' to install packages on Alpine Linux
# The 'build-base' package is often needed for compiling Python packages.
RUN apk add --no-cache ffmpeg jq python3-dev build-base

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN python3 -m pip check yt-dlp

CMD ["python3", "bot.py"]
