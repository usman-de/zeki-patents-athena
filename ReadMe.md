# Zeki Patents

Welcome to the Zeki patents Repository! To get started, follow the instructions below:

## Download Docker Image from AWS ECR

To work with this repository, you must download the Docker image from AWS ECR. Follow the instructions [here](https://thezeki.atlassian.net/wiki/spaces/E/pages/144605185/Running+DBT+in+Docker+A+Step-by-Step+Guide+for+AWS+ECR).

## Handling File Permission Issues

If you encounter file permission errors within the Docker container, follow these steps:

1. Navigate to the location of this repository.
2. Run the following command to resolve file permission issues:

    ```bash
    sudo chown $USER:$USER -R $pwd
    ```

Make sure to execute these commands to maintain proper file permissions.

Thank you