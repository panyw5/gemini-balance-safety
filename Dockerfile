FROM python:3.10-slim

WORKDIR /app

# 复制所需文件到容器中
COPY ./requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt
COPY ./app /app/app
ENV BASE_URL=https://generativelanguage.googleapis.com/v1beta
ENV TOOLS_CODE_EXECUTION_ENABLED=false
ENV IMAGE_MODELS='["gemini-2.0-flash-exp"]'
ENV SEARCH_MODELS='["gemini-2.0-flash-exp","gemini-2.0-pro-exp"]'

# Expose port
EXPOSE 7860

# Run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--no-access-log"]
