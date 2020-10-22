#!/bin/bash

set -e  # Stops shell script upon error.

echo "Starting the Hugo development server..."
hugo serve --disableFastRender --buildDrafts --buildFuture
