#!/usr/bin/env bash

# https://codelabs.developers.google.com/codelabs/cloud-dataflow-nyc-taxi-tycoon

echo "Enter projectID:"
read PROJECT

echo "Enter bucket name: (without the gs:// prefix)"
read BUCKET

echo "Enter zone:"
read ZONE

sed -e "s/<PROJECT>/${PROJECT}/" \
    -e "s/<BUCKET>/gs:\/\/${BUCKET}/" \
    -e "s/<ZONE>/${ZONE}/" \
    <./scripts/set-env.tmpl >./scripts/set-env.sh

cd dataflow
mvn compile
