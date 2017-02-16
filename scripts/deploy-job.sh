#!/usr/bin/env bash

. scripts/set-env.sh
cd dataflow
mvn exec:java -Dexec.mainClass="$1" \
    -e -Dexec.args="\
    --project=${PROJECT} \
    --sinkProject=${PROJECT} \
    --stagingLocation=${BUCKET} \
    --zone=${ZONE} \
    --runner=DataflowPipelineRunner \
    --streaming=true --numWorkers=3"
