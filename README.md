# ISEC6000 Assessment 2 - Node.js Application

This repository contains the Node.js web application used for ISEC6000 Secure DevOps Assessment 2.

It is forked from the AWS Elastic Beanstalk Express.js sample application and is used as the application source code repository for the Jenkins CI/CD pipeline.

Jenkins will pull this repository to install dependencies, run tests, perform dependency vulnerability scanning, build a Docker image, and push the image to a container registry.

The Jenkins and Docker Compose infrastructure configuration is stored separately in the related infrastructure repository:

- https://github.com/Jini10-01/isec6000-assessment2-jenkins

## Assessment Purpose

This repository will be used to demonstrate:

- Source code version control using GitHub.
- Pipeline-as-code using a `Jenkinsfile`.
- Node.js dependency installation and testing.
- Dependency vulnerability scanning as part of the CI/CD workflow.
- Docker image creation for the application.
- Docker image publication to a container registry.

## Planned CI/CD Files

The following files will be added or maintained for the assessment:

- `Jenkinsfile`: Defines the Jenkins CI/CD pipeline.
- `Dockerfile`: Defines how the Node.js application is containerised.
- `package.json`: Defines the Node.js application dependencies and scripts.

## Original Source

This repository is based on the AWS sample project:

- https://github.com/aws-samples/aws-elastic-beanstalk-express-js-sample

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.
