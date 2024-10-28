# Python Boilerplate

This is a pretty simple project with a basic setup for a new python environment
It currently uses
- Poetry: Package management
- Make: CLI Automation
- Docker: Containerization
- Ruff: Python linter and formatter
- Mypy: Type-checking
- Pytest: Testing framework
- Python Dotenv: Loading / Managing environment variables

In order to run this project you must have a few things installed.

To install python I recommend using pyenv. This allows you to manage different versions of python installed on your computer easily. Once installed you can run `pyenv install --list` to get a list of all available targets. For this project I use Pythong 3.12.2, so run `pyenv install 3.12.2` and let it do it's thing. You can set pyenv to use 3.12.2 globally or locally. If you run `pyenv global 3.12.2` it will start using 3.12.2 globally. For this project I only set it to use 3.12.2 locally, which pyenv knows because of the `.python-version` file. When in this folder pyenv should be using 3.12.2 automatically, or you can run `pyenv local 3.12.2` to configure that.

Install Poetry and Make. The latest versions of these should work fine. I would install all of these globally. From there you should be ready to go.

The first thing to do is create a `.env` file in the root and add to it `PROJECT=sample_project` as the only entry for now. Then when you're ready to install the project run:

`make`

This will configure poetry and install the project. If you look at the `makefile` file you can see what other commands are available. To run the project type:

`make run` and it will load that variable from your env file and greet you.
You can also run `make lint`, `make format`, and `make type_check`.

If you're feeling saucy you can install Docker and run 

`make docker_build` 

followed by

`make docker_run`

This will build a new docker image and fire it up and run our extensive test suite in docker, which ensures that 1 does in fact equal 1 and 2 = 1 + 1.

There is also a pre commit hook added using the `pre-commit` library that runs the linter and formatter and will stop you from committing if anything is wrong.