# Test Automation with testRigor for OpenEMR

This document provides step-by-step instructions for setting up test automation for OpenEMR using testRigor. It covers creating an account, setting up a test suite, and running tests using the testRigor CLI.

## Table of Contents

- [Creating an Account on testRigor](#creating-an-account-on-testrigor)
- [Setting Up testRigor Tunneling](#setting-up-testrigor-tunneling)
- [Running Tests with the CLI](#running-tests-with-the-cli)
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

## Setting Up testRigor Tunneling

1. **Download testRigor tunneling client application:**
   - Download the testRigor tunneling client for your Operating System and extract the archive content to any folder:
     - Windows: x86_64: [download](https://testrigor-storage.s3.amazonaws.com/tunneling-client/2.3.15/trtc_2.3.15_windows_amd64.zip)
     - Linux, x86_64: [download](https://testrigor-storage.s3.amazonaws.com/tunneling-client/2.3.15/trtc_2.3.15_linux_amd64.tar.gz)
     - macOS, Intel x86_64: [download](https://testrigor-storage.s3.amazonaws.com/tunneling-client/2.3.15/trtc_2.3.15_darwin_amd64.tar.gz)
     - macOS, Apple Silicon (M1-) arm64: [download](https://testrigor-storage.s3.amazonaws.com/tunneling-client/2.3.15/trtc_2.3.15_darwin_arm64.tar.gz)
   - There can be a false positive alarm from antivirus, and then you need to add the `trtc` executable file to antivirus exceptions.

2. **Setting up testRigor tunneling client configuration:**
   - Edit the `config.toml` file and replace the `XXXX` with a port number assigned by a testRigor representative.
     ```toml
     [[proxies]]
     name = "http_proxy_XXXX"
     type = "tcp"
     remotePort = XXXX
     
     [proxies.plugin]
     type = "http_proxy"
     ```

3. **Run tunneling client:**
   - To establish a tunnel to the testRigor cloud, run the `trtc` executable file. You should see the following messages in the console:
     ```
     2019-06-24 10:00:23.065 [I] [sub/root.go:109] start trtc service for config file [./config.toml]
     2019-06-24 10:00:23.085 [I] [client/service.go:294] try to connect to server...
     2019-06-24 10:00:23.801 [I] [client/service.go:286] [a8f97fc5870d6f22] login to server success, get run id [a8f97fc5870d6f22]
     2019-06-24 10:00:23.802 [I] [proxy/proxy_manager.go:173] [a8f97fc5870d6f22] proxy added: [http_proxy_XXXX]
     2019-06-24 10:00:24.070 [I] [client/control.go:168] [a8f97fc5870d6f22] [http_proxy_XXXX] start proxy success
     ```

4. **Setting up your test suite on app.testrigor.com:**
   - Go to the proxy settings of your test suite and enter the following string in the HTTP and HTTPS proxy settings: `tunnel.testrigor.com:XXXX`. Again, replace `XXXX` with a port number assigned by a testRigor representative. E.g.:

   Now you should be able to test your application using your internal network address using either IP or domain name. Also, you will be able to use any local names/addresses of your computer other than `localhost` or `127.0.0.1`.

## Running Tests with the CLI

1. **Install testRigor CLI:**
   - Ensure you have Node.js installed on your machine (version 18 or higher).
   - Install the testRigor CLI globally using npm:
     ```bash
     npm install -g testrigor
     ```

2. **Obtain Required Parameters:**
   - **Test Suite ID:** You can find the Test Suite ID in the URL of your test suite on the testRigor dashboard. It is located immediately after "https://app.testrigor.com/test-suites/". For example, if the URL is `https://app.testrigor.com/test-suites/12345`, then `12345` is your Test Suite ID.
   - **Auth Token:** Obtain your token from the "CI/CD integration" section on the testRigor dashboard. Look for "auth-token" and copy the value next to it, which will be in the format `########-####-####-####-############`.

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

## Additional Resources

- [testRigor Documentation](https://docs.testrigor.com/)
- [testRigor Command Line Documentation](https://testrigor.com/command-line/)
