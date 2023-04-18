#!/bin/bash

function real_dir() {
  pushd "$1" >/dev/null
  pwd -P
  popd >/dev/null
}
SCRIPT_FOLDER=$(real_dir "$(dirname "$0")")

SPRINT=sprint2
TASK_NAME=time_control

BASE_DIR=${SCRIPT_FOLDER}/../../../../
TESTS_FOLDER=${BASE_DIR}/cpp-backend-tests-practicum/tests

SOLUTION_FOLDER=${BASE_DIR}/sprint2/problems/time_control/solution

bash ${SCRIPT_FOLDER}/build.sh || exit 1

source ${BASE_DIR}/.venv/bin/activate

export CONFIG_PATH=${SOLUTION_FOLDER}/data/config.json
export IMAGE_NAME=time_control
export JSON_SCHEMA_PATH=${TESTS_FOLDER}/schemas/${SPRINT}/${TASK_NAME}.json

pytest --workers auto --junitxml=${BASE_DIR}/${TASK_NAME}.xml ${TESTS_FOLDER}/test_s02_time_control.py