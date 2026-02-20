FROM python:3.9
WORKDIR /app
COPY app.py requirements.txt /app/
RUN pip install -r requirements.txt
CMD ["python3" "app.py"]
EXPOSE 5000
