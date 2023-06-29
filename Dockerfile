ARG PORT=443
FROM cypress/included:9.5.4
FROM debian:jessie
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list  # Now archived
RUN apt-get update
CMD /bin/sh
RUN apt-get install python 3.11.2 -y
RUN echo $(python3 -m site --user--base)
COPY requirements.txt .
ENV PATH="$HOME/.local/bin:$PATH"
RUN apt-get update && apt-get install -y python3-pip && pip install -r requirements.txt
COPY . .
CMD uvicorn main:app --host 0.0.0.0 --port $PORT
