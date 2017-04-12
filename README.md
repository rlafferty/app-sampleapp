# app-sampleapp Cookbook

The app-sampleapp Cookbook is an *example* application cookbook.  This cookbook leverages wrapper cookbooks to maintain a runlist of all cookbooks required for an application.

## Scope

This cookbook is to provide a sample chef runlist that will provide the following:
- nginx, listening on port 80 serving a sample HTML page.  
- postgres database, installed, running, with a sample database (test_db) created
- python, python 3 is installed using virtualenv pattern
- git, this cookbook will ensure git is installed on the server

## Requirements

- Chef 12.5 or higher
- Network accessible package repositories

## Platform Support

The following platforms have been tested with Test Kitchen:

```
|----------------+-----+-------+-----+
|                | 0.1 | 0.1.1 | 1.1 |
|----------------+-----+-------+-----+
| ubuntu-14.04   | X   | X     | X   |
|----------------+-----+-------+-----+
| ubuntu-16.04   | X   | X     | X   |
|----------------+-----+-------+-----+
```

## Cookbook Dependencies

-[pm-postgresql](https://github.com/rlafferty/pm-postgresql.git)
-[pm-poise-python](https://github.com/rlafferty/pm-poise-python.git)
-[pm-nginx](https://github.com/rlafferty/pm-nginx.git)

## Usage

Add this cookbook to the runlist for a node that would be running this application.

## Attributes

### Postgres attributes
- `['app-sampleapp']['postgres']['database-name']` - set this to be the name of the database you would like to create
- `['app-sampleapp']['postgres']['owner-name']` - database owner (must be existing user in the DB)

### Python attributes
- `['pm-poise-python']['python']['runtime-name']` - name of the python virtualenv
- `['pm-poise-python']['python']['version']` - python version to use in the virtualenv
- `['pm-poise-python']['python']['virtualenv-location']` - where the virtualenv files should be created (does not need to be an existing path - will be created if not existing)

### Web/Nginx attributes
- `['nginx']['default_root']` - root location of where the static assets should be served from
- `['app-sampleapp']['nginx']['conf_template']` - name of template file to use to configure nginx
- `['app-sampleapp']['nginx']['conf_cookbook']` - cookbook name of where template file is located


## Frequently Asked Questions


## License

```text
Copyright:: 2009-2017 Chef Software, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
