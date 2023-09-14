FROM python:3.11
LABEL maintainer="jdamerow@asu.edu"

RUN apt-get update
RUN apt install -y tesseract-ocr
RUN apt install -y libtesseract-dev
RUN apt install -y build-essential libpoppler-cpp-dev pkg-config
RUN apt install -y poppler-utils

WORKDIR /code
COPY extract_images.py .
COPY pdf_image_extractor.py .
COPY requirements.txt .
COPY Ketchem.pdf .

RUN pip install -r requirements.txt

