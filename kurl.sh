
# docker rm -f kurl-container || true

# docker run \
#     --name kurl-container \
#     ubuntu sh -c "apt-get update && apt-get install curl -y && rm -rf /var/lib/apt/lists/*" \
# && docker commit kurl-container paulopez/kurl-image:0.1 \
docker build -f Dockerfile -t paulopez/kurl-image:0.1 . \
&& docker push paulopez/kurl-image:0.1