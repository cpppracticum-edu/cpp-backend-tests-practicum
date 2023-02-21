#!/bin/bash

BASE_DIR=${PWD}
SCRIPT_FOLDER=${BASE_DIR}/cpp-backend-tests-practicum/scripts/sprint4/bookypedia-2
SOLUTION_FOLDER=${BASE_DIR}/sprint4/problems/bookypedia-2/solution


cd ${SOLUTION_FOLDER} || exit 1
mkdir build
cd build
conan install ..
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . -j $(nproc)