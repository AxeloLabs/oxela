#!/bin/bash

PROJECT_ID="oxela-dataconnect"
REGION="us-central1"
ACCESS_TOKEN=$(gcloud auth print-access-token)

TEXT="Test embedding text"
MODELS=(
  "textembedding-gecko@001"
  "textembedding-gecko@003"
  "textembedding-gecko-multilingual@001"
  "text-multilingual-embedding-002"
  "text-embedding-004"
  "text-embedding-005"
)

for MODEL_ID in "${MODELS[@]}"; do
  echo "🔍 Testing model: $MODEL_ID"

  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -H "Content-Type: application/json" \
    -d '{
      "instances": [ { "content": "'"$TEXT"'" } ]
    }' \
    "https://${REGION}-aiplatform.googleapis.com/v1/projects/${PROJECT_ID}/locations/${REGION}/publishers/google/models/${MODEL_ID}:predict")

  if [ "$RESPONSE" == "200" ]; then
    echo "✅ $MODEL_ID is AVAILABLE"
  else
    echo "❌ $MODEL_ID is NOT available (HTTP $RESPONSE)"
  fi

  echo "--------------------------------------"
done