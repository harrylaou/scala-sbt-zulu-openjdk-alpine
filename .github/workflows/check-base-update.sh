#!/bin/bash

# Helper script to manually check if base image has been updated
# Usage: ./check-base-update.sh [image-name]

set -e

IMAGE_NAME=${1:-"harrylaou/scala-sbt-zulu-openjdk-alpine"}
BASE_IMAGE="azul/zulu-openjdk-alpine:17"

echo "Checking base image updates for: $IMAGE_NAME"
echo "Base image: $BASE_IMAGE"
echo "----------------------------------------"

# Get the current base image digest
echo "Fetching current base image digest..."
BASE_DIGEST=$(docker manifest inspect "$BASE_IMAGE" --verbose | jq -r '.Descriptor.digest')
echo "Current base image digest: $BASE_DIGEST"

# Check if our image exists
if docker manifest inspect "$IMAGE_NAME:latest" >/dev/null 2>&1; then
    echo "Fetching our image information..."
    
    # Try to get the base digest from labels
    CURRENT_BASE_DIGEST=$(docker inspect "$IMAGE_NAME:latest" 2>/dev/null | jq -r '.[0].Config.Labels["base-image-digest"] // empty' || echo "")
    
    if [ -n "$CURRENT_BASE_DIGEST" ]; then
        echo "Our image base digest: $CURRENT_BASE_DIGEST"
        
        if [ "$BASE_DIGEST" != "$CURRENT_BASE_DIGEST" ]; then
            echo "✅ Base image HAS BEEN UPDATED - rebuild recommended"
            exit 0
        else
            echo "ℹ️  Base image is unchanged - no rebuild needed"
            exit 1
        fi
    else
        echo "⚠️  No base digest label found in our image - cannot determine if update needed"
        echo "   Consider rebuilding to add tracking labels"
        exit 2
    fi
else
    echo "❌ Our image doesn't exist yet - initial build needed"
    exit 3
fi