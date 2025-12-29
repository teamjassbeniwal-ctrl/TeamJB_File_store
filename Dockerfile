FROM python:3.10-slim-bullseye

WORKDIR /VJ-File-Store

RUN apt update && apt install -y git \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "bot.py"]
