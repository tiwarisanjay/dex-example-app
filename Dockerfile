FROM golang:1.16-alpine

WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY *.go ./
RUN go build -o ./example-app
RUN chmod +x ./example-app
RUN mv ./example-app /usr/local/bin
CMD [ "example-app" ]
