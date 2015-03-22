[![Stories in Ready](https://badge.waffle.io/bayendor/big_brother.svg?label=ready&title=Ready)](http://waffle.io/bayendor/big_brother)
[![Code Climate](https://codeclimate.com/github/bayendor/big_brother/badges/gpa.svg)](https://codeclimate.com/github/bayendor/big_brother)
[ ![Codeship Status for bayendor/big_brother](https://codeship.com/projects/6753f780-ab00-0132-b9f4-42ab820675c2/status?branch=master)](https://codeship.com/projects/68179)

## Project Description

Big Brother is a two part application designed to analyze your command line activity.

A user registers with the Big Brother Ruby on Rails application via OAuth authentication with their GitHub account and is assigned an api_key that configures the `big_bro` command line tool.

A `big_bro` tool is installed on the users machine and parses the `.bash_history` file and uploads that history to the Big Brother site.

The tool explicilty ignores any use of the `export` command to avoid capturing any sensitive environment variables.

A user is then able to view the commands most commonly used along with relavent information that, it is hoped, will allow for insight into patterns of usage that can be adapted to make a developer more efficient.

## Getting Started

This tool is the command line client for the `Big Brother` project that gathers shell command / tool usage patterns.

Go to the [https://ministry-of-truth.herokuapp.com/getting_started](https://ministry-of-truth.herokuapp.com/getting_started) and then login with your Github account.  It will take you to a customized "Getting Started" page that includes step by step instructions, along with a customized API key.

## License
[Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0/deed.en_GB).
