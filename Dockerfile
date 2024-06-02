# Użyj oficjalnego obrazu Python 3.9 jako bazowego
FROM python:3.9

# Ustaw zmienną środowiskową dla nieinteraktywnej instalacji
ENV DEBIAN_FRONTEND=noninteractive

# Ustaw katalog roboczy w kontenerze
WORKDIR /app

# Skopiuj pliki aplikacji do katalogu roboczego
COPY . /app

# Zainstaluj wymagane biblioteki
RUN pip install --upgrade pip && pip install -r requirements.txt

# Ustaw zmienną środowiskową FLASK_APP
ENV FLASK_APP=app.py

# Ustaw zmienną środowiskową FLASK_RUN_HOST na 0.0.0.0, aby aplikacja była dostępna na wszystkich interfejsach sieciowych
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port 5000, który jest używany przez Flask
EXPOSE 5000

# Uruchom aplikację Flask
CMD ["flask", "run"]