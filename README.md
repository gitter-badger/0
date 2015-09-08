**Status: DEV**

Declarative Core-Composed System Orchestration Template
=======================================================

An opinionated [ccjson](https://github.com/LogicCores/ccjson) based minimal primitive-component-based development and runtime system template for declarative JavaScript front- and NodeJS back-ends that deploys and automatically tests itself.

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


Clone and use as Template
-------------------------

## Namespaces

Zero System is based on *namespaces* where all components have their own namespace. Components are then assembled into larger namespaces that form applications and systems. There are two primary categories of namespaces relevant to discuss here:

  * **External Namespaces** are namespaces that are exposed to external users of your system. These namespaces must be globally unique so anyone may consume your assets. Globally unique namespaces are derived from a **Reverse Hostname** that **you control**.
  * **Internal Namespaces** are namespaces used internally for directories and component prefixes among other uses and mapped to external namespaces. You can use one namespace to do a bunch of work internally and then serve it via another namespace. This is how features can be *subclassed across clones* and this is how you can get your system up and running fast by simply modifying the Zero System template.

### Constructing your own namespaces

Given a hostname such as `test.com` and a project you want to locate at `app.test.com` you may use the following namespaces:

  * External
    * Hostname: `app.test.com`
    * Root Namespace: `com.test.app`
    * Source Code Project Name: `com.test.app` (e.g. Github repository name)

  * Internal
    * Root Namespace: `com.test.app`
    * Namespace Directory: `com.test.app`

Notes:

  * You can safely *prefix* or *suffix* the above without breaking the namespacing rules and conflicting with others.
  * You can safely *modify* the internal namespace if you don't plan on sharing your code publicly or if you want to reflect your own top-level namespace you are commanding and expect others to use. If you choose to do the latter you can modify the external namespace as well.
  * **NOTE:** The `0.*` external and internal namespace is **RESERVED for official clones** belonging to the `0` ecosystem as curated by [Christoph Dorn](http://christophdorn.com/). You can use (overlay) the `0.*` namespace for your own purposes, just keep in mind that it may conflict with official clones by the `0` community in future. This means you will be choosing to become incompatible with a future community unless your clone is the one that becomes official (something you should not bet on).

## Instructions

  1. Fork [github.com/LogicCores/0](https://github.com/LogicCores/0.git) and rename it to something `<ReverseHostname>.*` where `<ReverseHostname>` is a hostname **you have control over**. This is your *root external namespace* and will ensure your clone will never conflict with other cloens you have nor with anyone else's (see *Constructing your own namespaces* above).
  2. Develop your application in your chosen internal `<ReverseHostname>.*` namespace *in parallel* to the internal `0.*` namespace.
  3. Use the `0.*` application as a reference and to contribute back.
  4. Exclude the public `0.*` namespace when distributing your application (will happen by default).
  5. Let us know how you fare; good or bad so we can improve the process.

To deploy your clone see [zerosystem.io/Install](http://zerosystem.io/Install).


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

`ccjson` is the config orchestration solution for Zero System and can be found here: [github.com/LogicCores/ccjson](https://github.com/LogicCores/ccjson)


Provenance
==========

Original source logic [UNLICENSED](http://unlicense.org/) by [Christoph Dorn](http://christophdorn.com)
