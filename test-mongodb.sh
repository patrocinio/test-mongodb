#/bin/bash
# Inspired by https://hub.jazz.net/project/communitysample/postgresql-nodejs/overview
# You need CF CLI before running this script: https://console.ng.bluemix.net/docs/cli/index.html#cli

APP_NAME=patrocinio-test-mongodb

# Parameters
# $1: app name
# $2: name
check_url () {
set -x
# Grab URL
URL=`cf app $APP_NAME | grep urls | awk '{print $2}' | cut -f1 -d','`

# Check response
LINE=`wget --server-response --content-on-error=off ${URL} 2>&1 | grep HTTP`

# Prints result
if [[ "$LINE" == *"200"* ]]; then
echo $2 working great!
else
echo $2 failed :-/
fi
}

# Push the application
cf push $APP_NAME --no-start --random-route

# Bind the app to the service
SERVICE_NAME=mongodb
cf bs $APP_NAME $SERVICE_NAME

if [[ $? -ne 0 ]];
then
    echo Failed to bind $SERVICE_NAME to $APP_NAME
    echo Ensure we have a service called $SERVICE_NAME
else
  # Start the app
  echo Starting the application...
  cf start $APP_NAME

  # Check response
  check_url $APP_NAME "MongoDB"
fi