💎🔗 Langchain.rb for Rails
---
⚡ Building applications with LLMs through composability ⚡

👨‍💻👩‍💻 CURRENTLY SEEKING PEOPLE TO FORM THE CORE GROUP OF MAINTAINERS WITH

:warning: UNDER ACTIVE AND RAPID DEVELOPMENT (MAY BE BUGGY AND UNTESTED)

![Tests status](https://github.com/andreibondarev/langchainrb_rails/actions/workflows/ci.yml/badge.svg?branch=main)
[![Gem Version](https://badge.fury.io/rb/langchainrb_rails.svg)](https://badge.fury.io/rb/langchainrb_rails)
[![Docs](http://img.shields.io/badge/yard-docs-blue.svg)](http://rubydoc.info/gems/langchainrb_rails)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/andreibondarev/langchainrb_rails/blob/main/LICENSE.txt)
[![](https://dcbadge.vercel.app/api/server/WDARp7J2n8?compact=true&style=flat)](https://discord.gg/WDARp7J2n8)


Langchain.rb is a library that's an abstraction layer on top many emergent AI, ML and other DS tools. The goal is to abstract complexity and difficult concepts to make building AI/ML-supercharged applications approachable for traditional software engineers.

## Installation

Install the gem and add to the application's Gemfile by executing:

    bundle add langchainrb_rails

If bundler is not being used to manage dependencies, install the gem by executing:

    gem install langchainrb_rails

## Rails Generators

### Pinecone Generator - adds vectorsearch to your ActiveRecord model

```
rails generate langchainrb_rails:pinecone --model=Product --llm=openai
```

Available `--llm` options: `cohere`, `google_palm`, `hugging_face`, `llama_cpp`, `ollama`, `openai`, and `replicate`. The selected LLM will be used to generate embeddings and completions.

The `--model` option is used to specify which ActiveRecord model vectorsearch capabilities will be added to.

Pinecone Generator does the following:
1. Creates the `config/initializers/langchainrb_rails.rb` initializer file
2. Adds necessary code to the ActiveRecord model to enable vectorsearch
3. Adds `pinecone` gem to the Gemfile
