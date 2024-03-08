#!/bin/zsh

# Check for the required action argument
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 [webpack|angular]"
  exit 1
fi

# Path to the angular.json file
FILE="angular.json"

# Forward replacement
angular() {
  sed -i '' -e 's/@angular-builders\/custom-webpack:browser/@angular-devkit\/build-angular:browser/g' \
         -e 's/@angular-builders\/custom-webpack:dev-server/@angular-devkit\/build-angular:dev-server/g' "$FILE"
}

# Backward replacement
webpack() {
  sed -i '' -e 's/@angular-devkit\/build-angular:browser/@angular-builders\/custom-webpack:browser/g' \
         -e 's/@angular-devkit\/build-angular:dev-server/@angular-builders\/custom-webpack:dev-server/g' "$FILE"
}

# Perform the requested action
case "$1" in
  webpack)
    webpack
    ;;
  angular)
    angular
    ;;
  *)
    echo "Invalid argument: $1. Use 'webpack' or 'angular'."
    exit 1
    ;;
esac

echo "Replacement completed successfully."
