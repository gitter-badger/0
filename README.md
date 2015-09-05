**Status: DEV**

Declarative Core-Composed System Orchestration Template
=======================================================

An opinionated minimal primitive-component-based development and runtime system template for declarative front- and back-ends that deploys and automatically tests itself.

> Create stable static assets for deployment from your dynamic source logic.

[http://zerosystem.io/](http://zerosystem.io/)

[![Build Status](https://travis-ci.org/LogicCores/0.svg)](https://travis-ci.org/LogicCores/0)


Setup
-----

### Required

  * NodeJS
  * OSX (only for now)


Evaluate
--------

	git clone https://github.com/LogicCores/0.git
	cd 0
	npm install

	# Development
	npm run edit        # Will launch an editor
	npm run dev         # Will run system in development mode
	npm test            # Will test system

	# Production
	npm start           # Will run system in production mode

	# Deploy
	npm run deploy      # Will deploy latest commit


Use as Template
---------------

  1. Fork [github.com/LogicCores/0](https://github.com/LogicCores/0.git) and rename it to something `0.*`
  2. Develop your application in your chosen `0.*` namespace *in parallel* to the `0` namespace
  3. Use the `0` application as a reference and to contribute back
  4. Exclude the `0` namespace when distributing your application (will happen by default)
  5. Let us know how you fare; good or bad so we can improve the process


FAQ
===

### What is the scope of this project?

We are focusing on creating stable models for declarative development of distributed systems by validating them with minimal implementation in the form of a unified system template containig generic interface modules with adapters to popular domain-specific tool implementations.

The idea is that this system template is cloned many times and the systems built with it can provide feedback to refine the primitives that are needed as a foundation for all.

This project strictly focuses on minimal code and implementing *one* example of each *core* along with adapters using **NodeJS** as a backend and any **JavaScript** runtime as a front-end. It is left to other projects and communities to build on this foundation. It is anticipated that this foundation is continuously refined to reflect the advances made in derivative and alternative works in an effort to build and maintain compatibility and grow the *declarative composition community of tools and users*.

### What is `PINF.Genesis.ccjson`?

[PINF.Genesis](https://github.com/pinf/genesis.pinf.org) is a (work in progress) *Declarative Web Software Systems Domain Model and Manifestation Platform*.

This *Declarative Core-Composed System Template* is a crystalization of core primitives from the *PINF.Genesis* platform and will be leveraged within the *PINF.Genesis* platform to ready it for general use over time.

We do not **use** *PINF.Genesis* in this template but are *implementing one model* of the *PINF.Genesis approach* using minimal implementation and targeting it to **NodeJS** and **JavaScript** specifically. Whatever we do here will be compatible with the **much wider scoped** *PINF.Genesis* platform which targets many runtimes and languages when it is released for general use.

We already use the *PINF.Genesis.ccjson* file to get ready for when *PINF.Genesis* is released as this project will act as one reference implementation of a *PINF.Genesis* based system at that time.


