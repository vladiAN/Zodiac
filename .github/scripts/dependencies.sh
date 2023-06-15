#!/bin/bash

set -eo pipefail

steps:
  - name: Set execute permission
    run: chmod +x ./.github/scripts/dependencies.sh

  - name: Run dependencies.sh
    run: ./.github/scripts/dependencies.sh


    if [ -e "$NAME.xcworkspace" ]
then
    xcodebuild -workspace "$NAME".xcworkspace -scheme "$NAME" -resolvePackageDependencies
else
    xcodebuild -project "$NAME".xcodeproj -scheme "$NAME" -resolvePackageDependencies
fi
