
# Facilitated Install

*TODO: Implement*

<button class="ui primary button">Install Developer Companion Browser Extension</button>
<br/>

Zero System uses [Developer Companion](https://github.com/devcomp/0.DeveloperCompanion) to install itself on your desktop from where you can use it to deploy your modified clones. If you choose this path you can **ignore everything below**. Developer Companion is a Zero System Clone and 100% open source just like Zero System.

# The Manual Way

## Local Install

*TODO: Import this from ../../../README.md*

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


# Deployment Setup

We recommend you setup the following stack as a foundation for your project. These services have been picked because they are free for open source / light use and have paid upgrade options when your system grows or is private.

You can use alternative services (for which there is an adapter) but we recommend not skipping any of these layers for the following reasons:

  * **Hosting Provider** - You **must have** a place to run your system.
  * **Asset Hosting** - You *really need* a place to store encrypted build assets.
  * **Build Provider** - You *really need* a place to run frequent tests (outside of your local development context) to validate and solidify changes you make to the system.
  * **Code Repository** - You *really need* a place to exchange code with others.

Requirements (Zero System receives **no** *affiliate revenue* as a result of suggesting these services):

  * Heroku *(Hosting Provider)*
  * Dropbox *(Asset Hosting)*
  * TravisCI *(Build Provider)*
  * Github *(Code Repository)*


## Configuration

  * Configure deployment profiles in `/data/0/Deployments/*/profile.ccjson`
  * To update an encrypted variable use `[ENCRYPT:PIO_PROFILE_KEY+PIO_PROFILE_SECRET:<PlainTextValueToBeEncrypted>]` and commit the file. It will be encrypted *pre-commit* and you will then need to stage and commit the encrypted variable. You can also run `npm run encrypt` at any time.


### Heroku

*TODO: Complete setup instructions*

    git push heroku master


