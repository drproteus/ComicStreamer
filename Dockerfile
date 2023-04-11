FROM python:2.7-buster
COPY requirements.txt ./
RUN apt update && apt install -y p7zip
RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt
COPY . .
RUN paver libunrar
EXPOSE 32500
CMD ["python", "comicstreamer"]
