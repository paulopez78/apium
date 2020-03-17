FROM golang:1.14 AS builder

WORKDIR /app

COPY go.mod  .
COPY go.sum .
RUN go mod download

COPY . .

RUN go test
RUN go build -o build/votingapp && cp -r ./ui ./build


# RUNTIME IMAGE
##########################################################

FROM ubuntu
WORKDIR /app
COPY --from=builder /app/build .
ENTRYPOINT [ "./votingapp" ]