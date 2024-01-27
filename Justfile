MM_VERSION := "9.4.1"

build-local:
    docker build \
        --build-arg="MM_VERSION={{MM_VERSION}}" \
        --tag wmluke/mattermost:{{MM_VERSION}} \
        --tag wmluke/mattermost:latest  .

build-linux:
    docker buildx build --builder cloud-wmluke-main-cloud-builder \
        --build-arg="MM_VERSION={{MM_VERSION}}" \
        --tag wmluke/mattermost:latest \
        --tag wmluke/mattermost:{{MM_VERSION}} \
        --platform linux/arm64,linux/amd64 \
        --push .
