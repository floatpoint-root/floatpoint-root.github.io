#!/bin/bash

set -e  # Stops shell script upon error.

echo "Building Hugo site for production..."
rm -rf public/
hugo -e production --minify
echo "Done."

echo "Committing build to branch [gh-pages]."
cd public  \
    && git add --all \
    && git commit -m "Builds site for gh-pages."  \
    && cd ..
echo "Done."
