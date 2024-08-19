#!/bin/bash

# Define suite ID and auth token
TEST_SUITE_ID=""
AUTH_TOKEN=""

# Paths for the test cases and rules files
TEST_CASES_PATH="./test_cases/**/*.txt"
RULES_PATH="./rules/**/*.txt"

# Command to run the tests using the testRigor CLI
testrigor test-suite run "$TEST_SUITE_ID" --token "$AUTH_TOKEN" --test-cases-path "$TEST_CASES_PATH" --rules-path "$RULES_PATH"
