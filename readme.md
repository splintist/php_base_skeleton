# PHP Project Base Skeleton
A PHP Project base skeleton based on the php{Version}-apache-Dockerfile. 
Comes with useful dev-Skripts and dev-/staging-/prod build-configuration.

# Requirements
- Docker with Buildkit enabled

# Composer
- Dependencies for this project-skeleton are managed by composer. Run
`./bin/runComposer.sh {composer-command}` from the project root to install dependencies

# Tests
- This Project uses PHPUnit for Unittesting. 
Run `./bin/runTests.sh` from the project root to run tests.

# Build
To build the project run `./bin/buildApp.sh {dev|staging|prod}` from the project root.

# Run
To run/start the container run `./bin/runApp.sh` from the project root.

# PHPStorm Configurations
If you use PHPStorm you can also use PHPStorm-Run-Configurations provided in bin-Folder
as an alternative to the described shell-scripts.

# Have fun