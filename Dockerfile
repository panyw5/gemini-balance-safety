FROM python:3.10-slim

WORKDIR /app

COPY ./requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt
COPY ./app /app/app
ENV BASE_URL=https://generativelanguage.googleapis.com/v1beta
ENV TOOLS_CODE_EXECUTION_ENABLED=false
ENV IMAGE_MODELS='["gemini-2.0-flash-exp"]'
ENV SEARCH_MODELS='["gemini-2.0-flash-exp","gemini-2.0-pro-exp"]'

# Hugging Face Spaces uses port 7860
EXPOSE 7860

# Use 7860 port for Hugging Face
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860"]
