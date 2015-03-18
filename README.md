[![Stories in Ready](https://badge.waffle.io/bayendor/big_brother.svg?label=ready&title=Ready)](http://waffle.io/bayendor/big_brother)
[![Code Climate](https://codeclimate.com/github/bayendor/big_brother/badges/gpa.svg)](https://codeclimate.com/github/bayendor/big_brother)
[ ![Codeship Status for bayendor/big_brother](https://codeship.com/projects/6753f780-ab00-0132-b9f4-42ab820675c2/status?branch=master)](https://codeship.com/projects/68179)

README

Big Brother is a two part application designed to analyze the your command line activity.

A user registers with the Big Brother Ruby on Rails application via OAuth authentication with their GitHub account and is assigned an api_key that configures the `big_bro` command line tool.

A `big_bro` tool is installed on the users machine and parses the `.bash_history` file and uploads that history to the Big Brother site.

The tool explicilty ignores any use of the `export` command to avoid capturing any sensitive environment variables.

A user is then able to view the commands most commonly used along with relavent information that, it is hoped, will allow for insight into patterns of usage that can be adapted to make a developer more efficient.
