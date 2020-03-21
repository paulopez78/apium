FROM golang:1.14-alpine AS builder

WORKDIR /app

COPY go.mod  .
COPY go.sum .
RUN go mod download

COPY . .

ENV CGO_ENABLED=0 
RUN go test
RUN go build -o build/votingapp && cp -r ./ui ./build


# RUNTIME IMAGE
##########################################################

FROM alpine
WORKDIR /app
COPY --from=builder /app/build .
ENTRYPOINT [ "./votingapp" ]