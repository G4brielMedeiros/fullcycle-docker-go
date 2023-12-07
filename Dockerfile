FROM golang:alpine3.17 as builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . ./
RUN go build -o fullcycle

FROM scratch

COPY --from=builder /app/fullcycle /

ENTRYPOINT ["/fullcycle"]