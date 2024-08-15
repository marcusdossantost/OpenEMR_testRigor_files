#!/bin/bash

# Define suite ID and auth token
TEST_SUITE_ID="d6qQGsxnE32fbQrka"
AUTH_TOKEN="f84d2dfe-df5a-4481-b6c7-67c076af48a8"

# Paths for the test cases and rules files
TEST_CASES_PATH="./test_cases/**/*.txt"
RULES_PATH="./rules/**/*.txt"

# Command to run the tests using the testRigor CLI
testrigor test-suite run "$TEST_SUITE_ID" --token "$AUTH_TOKEN" --test-cases-path "$TEST_CASES_PATH" --rules-path "$RULES_PATH"
