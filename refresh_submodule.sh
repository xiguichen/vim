#!/bin/bash

# list modules under bundle directory first
bundles=$(ls bundle)
for bundle in $bundles;do
    echo "Bundle: $bundle"
    # Check if this bundle aready in submodules
    cat .gitmodules | grep $bundle
    if [[ $? -ne 0 ]]; then
        git rm --cached bundle/$bundle
        origin_url=$(git -C bundle/$bundle config --list | grep "remote.origin.url" | awk -F'=' '{print $2}')
        # echo $origin_url
        git submodule add $origin_url bundle/$bundle
    fi
done
