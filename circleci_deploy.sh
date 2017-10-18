#!/bin/bash

go get github.com/aktau/github-release

VERSION=`echo ${CIRCLE_BRANCH} | tr -d release-`

github-release release --user "$CIRCLE_PROJECT_USERNAME" --repo "$CIRCLE_PROJECT_REPONAME" --tag "v${VERSION}" --name "version${VERSION}"

github-release upload --user "$CIRCLE_PROJECT_USERNAME" --repo "$CIRCLE_PROJECT_REPONAME" --tag $VERSION --name "libci_test.a" --file "build/libci_test.a"
