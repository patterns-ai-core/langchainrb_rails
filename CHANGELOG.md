# CHANGELOG

## Key
- [BREAKING]: A breaking change. After an upgrade, your app may need modifications to keep working correctly.
- [FEATURE]: A non-breaking improvement to the app. Either introduces new functionality, or improves on an existing feature.
- [BUGFIX]: Fixes a bug with a non-breaking change.
- [COMPAT]: Compatibility improvements - changes to make Administrate more compatible with different dependency versions.
- [OPTIM]: Optimization or performance increase.
- [DOCS]: Documentation changes. No changes to the library's behavior.
- [SECURITY]: A change which fixes a security vulnerability.

## [0.1.12] - 2024-09-20
- Adding `rails g langchainrb_rails:assistant --llm=...` generator
- Adding `rails g langchainrb_rails:prompt` generator

## [0.1.11] - 2024-06-16
- Add destroy_from_vectorsearch hook

## [0.1.10] - 2024-05-20

## [0.1.9] - 2024-04-19
- Bump langchainrb gem to include v0.11.x
- Remove pg_vector Overriding Operator Constants

## [0.1.8] - 2024-03-16
- Bump langchainrb gem

## [0.1.7] - 2024-01-29
- Fix Pgvector#ask method

## [0.1.6] - 2024-01-25
- Fix bug when multiple ActiveRecord models use vectorsearch
- Bump langchainrb version
- Avoid extra query when Pgvector is used

## [0.1.5] - 2023-11-30
- Qdrant vectorsearch generator

## [0.1.4] - 2023-11-20
- Bugfix AR integration when using vectorsearch other than Pgvector

## [0.1.3] - 2023-11-01
- Pgvector vectorsearch generator

## [0.1.2] - 2023-10-27
- Pinecone vectorsearch generator

## [0.1.1] - 2023-10-23

## [0.1.0] - 2023-10-22
- Initial release
