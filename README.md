# Test Automation with testRigor for OpenEMR

This document provides step-by-step instructions for setting up test automation for OpenEMR using testRigor. It covers creating an account, setting up a test suite, and running tests using the testRigor CLI.

## Table of Contents

- [Creating an Account on testRigor](#creating-an-account-on-testrigor)
- [Creating a Test Suite](#creating-a-test-suite)
- [Running Tests with the CLI Locally](#running-tests-with-the-cli-locally)
- [Running Tests with the CLI (Non-Local Environment)](#running-tests-with-the-cli-non-local-environment)
- [Additional Resources](#additional-resources)

## Creating an Account on testRigor

1. **Visit the testRigor website:**
   - Go to [testRigor](https://www.testrigor.com/).

2. **Sign up for a new account:**
   - Click on the "Sign Up" button on the top right corner.
   - Choose the "Public Open Source" version.
   - Fill in the required details (name, email, password) and follow the instructions to complete the registration.

3. **Verify your email:**
   - Check your email inbox for a verification email from testRigor.
   - Click on the verification link to activate your account.

4. **Log in to your account:**
   - Once your account is activated, log in using your email and password.

## Creating a Test Suite

1. **Navigate to the Test Suites section:**
   - After logging in, you will be directly taken to the page where you can create a test suite.

2. **Create a new test suite:**
   - **Enter a name for the test suite:** Provide a meaningful name for your test suite.
   - **Select the type of testing:** Choose "Desktop Web Testing" from the "Type of Testing" dropdown menu.
   - **Enter the URL:** Input a placeholder URL such as "https://www.google.com". This URL will be overwritten with your local URL settings during actual test runs.
   - **Fill in the login credentials:** 
     - **Username:** Enter "admin".
     - **Password:** Enter "pass".
   - **Set the number of test cases to generate using AI:** Choose "0" to ensure that no AI-generated test cases are included.

3. **Click on "Create Test Suite":**
   - Once all the details are filled in, click the "Create Test Suite" button to save and finalize your new test suite.

## Running Tests with the CLI Locally

1. **Install testRigor CLI:**
   - Ensure you have Node.js installed on your machine (version 18 or higher).
   - Install the testRigor CLI globally using npm:
     ```bash
     npm install -g testrigor
     ```
   - Make sure that OpenEMR is running locally.

2. **Obtain Required Parameters:**
   - **Test Suite ID:** You can find the Test Suite ID in the URL of your test suite on the testRigor dashboard. It is located immediately after "https://app.testrigor.com/test-suites/". For example, if the URL is `https://app.testrigor.com/test-suites/12345`, then `12345` is your Test Suite ID.
   - **Auth Token:** Obtain your token from the "CI/CD integration" section on the testRigor dashboard. Look for "auth-token" and copy the value next to it, which will be in the format `########-####-####-####-############`.
   - **Localhost URL:** This is the URL where your OpenEMR instance is running locally. It can be an IP address like `127.0.0.1` or a specific URL like `localhost:1234`.

3. **Run Tests:**
   - Use the following command to execute your tests:
     ```bash
     testrigor test-suite run <test-suite-id> --token <token> --localhost --url <localhost-url>
     ```
   - Replace the placeholders with your actual parameters:
     - `<test-suite-id>` with the Test Suite ID you obtained.
     - `<token>` with your auth token.
     - `<localhost-url>` with the URL where OpenEMR is running locally (e.g., `http://127.0.0.1:8080` or `http://localhost:1234`).

4. **View Test Results:**
   - After running the tests, you can view the results in the testRigor dashboard under the "Test Cases" section.

## Running Tests with the CLI (Non-Local Environment)

1. **Install testRigor CLI:**
   - Ensure you have Node.js installed on your machine (version 18 or higher).
   - Install the testRigor CLI globally using npm:
     ```bash
     npm install -g testrigor
     ```

2. **Obtain Required Parameters:**
   - **Test Suite ID:** You can find the Test Suite ID in the URL of your test suite on the testRigor dashboard. It is located immediately after "https://app.testrigor.com/test-suites/". For example, if the URL is `https://app.testrigor.com/test-suites/12345`, then `12345` is your Test Suite ID.
   - **Auth Token:** Obtain your token from the "CI/CD integration" section on the testRigor dashboard. Look for "auth-token" and copy the value next to it, which will be in the format `########-####-####-####-############`.
   - **Remote URL:** This is the URL where your OpenEMR instance or the application under test is hosted. Ensure this URL is accessible over the internet. For example, it could be something like `https://yourapp.com` or `http://yourapp.com:8080`.

3. **Run Tests:**
   - Use the following command to execute your tests:
     ```bash
     testrigor test-suite run <test-suite-id> --token <token> --url <remote-url>
     ```
   - Replace the placeholders with your actual parameters:
     - `<test-suite-id>` with the Test Suite ID you obtained.
     - `<token>` with your auth token.
     - `<remote-url>` with the URL where your OpenEMR or application is hosted remotely (e.g., `https://yourapp.com` or `http://yourapp.com:8080`).

4. **View Test Results:**
   - After running the tests, you can view the results in the testRigor dashboard under the "Test Cases" section.

## Additional Resources

- [testRigor Documentation](https://docs.testrigor.com/)
- [testRigor Command Line Documentation](https://testrigor.com/command-line/)
