#!/usr/bin/env bash

FILE="coverage.txt"
CI_COMMIT_REF_NAME="main"

if [[ $CI_COMMIT_REF_NAME == "main" ]]; then
  if [ -f $FILE ]; then
    TOTAL_COVERAGE=$(egrep '^total:.*(statements).*' $FILE | egrep -o '[0-9]+\.[0-9]+')
    echo "Total coverage: $TOTAL_COVERAGE%"
    #echo "coverage $TOTAL_COVERAGE" | curl -s --data-binary @- http://$PROMETHEUS_URL/metrics/job/code_coverage/instance/$CI_PROJECT_NAME

    # Check if there are any parameters passed.
    if [ $# != 0 ]; then
      # Check for flags and print the appropriate value in the correct format.
      if [ $1 == "--overall" ]; then
        echo "overall_coverage $TOTAL_COVERAGE%"
      elif [ $1 == "--new-feature" ]; then
        echo "new_feature_coverage $TOTAL_COVERAGE%"
      fi
    fi
    
  else
    echo "$FILE not found"
  fi
fi
