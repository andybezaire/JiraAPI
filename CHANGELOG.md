# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
### Changed
- using init to create urlrequest and not building it
### Deprecated
### Removed
### Fixed
### Security

## [0.4.0] - 2021-04-12
### Added
- public profile of the authenticated user endpoint

## [0.3.0] - 2021-04-11
### Added
- public api for response objects

## [0.2.0] - 2021-04-05
### Added
- response object access modified
- OauthTokenResponse tests
- Oauth token refresh request body
### Removed
- token signing no longer done in this module
### Fixed
- tidyd package file

## [0.1.2] - 2021-03-29
### Changed
- made single Model scope
- made rest of models public

## [0.1.1] - 2021-03-29
### Changed
- moved models to Models scope instead of being in JiraAPI or JiraAPI.Auth
- made urls and requests, models public

## [0.1.0] - 2021-03-28
### Added
- added changelog
- added urls and requests for loggin in
- set up readme with initial version

[Unreleased]: https://github.com/andybezaire/JiraAPI/compare/0.2.0...HEAD
[0.2.0]: https://github.com/andybezaire/JiraAPI/compare/0.1.2...0.2.0
[0.1.2]: https://github.com/andybezaire/JiraAPI/compare/0.1.1...0.1.2
[0.1.1]: https://github.com/andybezaire/JiraAPI/compare/0.1.0...0.1.1
[0.1.0]: https://github.com/andybezaire/JiraAPI/releases/tag/0.1.0
