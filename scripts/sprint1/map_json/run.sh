#!/bin/bash

function real_dir() {
  pushd "$1" >/dev/null
  pwd -P
  popd >/dev/null
}
SCRIPT_FOLDER=$(real_dir "$(dirname "$0")")

BASE_DIR=${SCRIPT_FOLDER}/../../../../
SOLUTION_FOLDER=${BASE_DIR}/sprint1/problems/map_json/solution

bash ${SCRIPT_FOLDER}/build.sh || exit 1

source ${BASE_DIR}/.venv/bin/activate

export DELIVERY_APP=${SOLUTION_FOLDER}/build/bin/game_server
export CONFIG_PATH=${SOLUTION_FOLDER}/data/config.json
export COMMAND_RUN="${DELIVERY_APP} ${CONFIG_PATH}"

python3 -m pytest --rootdir=${BASE_DIR} --verbose --junitxml=${BASE_DIR}/map_json.xml ${BASE_DIR}/cpp-backend-tests-practicum/tests/test_l04_map_json.py
