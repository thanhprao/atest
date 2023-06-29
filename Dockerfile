ARG PORT=443
FROM cypress/included:9.5.4
FROM 3.11-bullseye
RUN apt-get install python 3.11 -y
RUN echo $(python3 -m site --user--base)
COPY requirements.txt .
ENV PATH="$HOME/.local/bin:$PATH"
RUN apt-get update && apt-get install -y python3-pip && pip install -r requirements.txt
COPY . .
CMD uvicorn main:app --host 0.0.0.0 --port $PORT
