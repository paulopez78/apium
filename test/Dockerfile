FROM alpine

# RUN apt-get update && apt-get install -y curl jq 
RUN apk update && apk add --no-cache curl jq 

COPY test.sh .

RUN chmod +x test.sh
ENTRYPOINT ["./test.sh" ]