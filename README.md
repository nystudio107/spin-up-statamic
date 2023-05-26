# Spin Up Statamic

Allows you to create your own self-contained Statamic project complete site config, Antlers/Blade/Twig template files, assets, and devops shrink-wrapped with Docker, which you can distribute to others or use yourself.

Use it for:
- Spinning up a Statamic site in a browser in GitHub Codespaces
- Shipping a self-contained Statamic site to others
- Providing working example code & projects to others
- Spinning up a local Statamic project using someone else's `composer.json` for support

**N.B.:** This is _not_ intended to be a fully functional local development environment for client sites (there is no `buildchain`, for example).

## Making a new Statamic project

This is a template repository. Click on **Use this template** on [GitHub](https://github.com/nystudio107/spin-up-statamic) and select **Create a new repository**.

You will then be able to name the new repository, and a clone of this repo will be created there.

The project you'll get is the default Statamic starter you might create with `statamic new`, with the Spin Up Statamic scaffolding around it.

If you intend to use this as a [Template Repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository) (like Spin Up Statamic is), you'll want to go to the repo **Settings** and check the **Template repository** checkbox.

You can also consider [adding an **Open in Codespaces**](https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/setting-up-your-repository/adding-a-codespaces-badge) button.

## Using your Statamic project in a browser via GitHub Codespaces

1. Go to your repo in GitHub
2. Click on **Use this template** and select **Open in a codespace** if your repository is a Template Repository. If it is a regular repository, click on **Code**, then click on the **Codespaces** tab, and click on the **Creat codespace on ...** button
3. In the resulting Terminal window, type `make dev` to start the project up
4. Wait until you see output like this, and then access the site via the credentials that are output on the console:

```
queue_1    | ### Your Statamic site is ready!
queue_1    | Frontend URL: https://khalwat-opulent-xylophone-q59g6p5vqj3rvr-8050.preview.app.github.dev/
queue_1    | CP URL: https://khalwat-opulent-xylophone-q59g6p5vqj3rvr-8050.preview.app.github.dev/cp
queue_1    | CP User: demo@statamic.com
queue_1    | CP Password: password
```

This lets anyone use the project without having to do _any_ local setup.

You can use the Codespaces editor to edit template files, load the site frontend, or log into the Statamic CP, all from within a browser!

The first time you start up your project in Codespaces, it'll take some time to set everything up. However, subsequent startups will be very quick.

You can access your existing Codespaces here:

https://github.com/codespaces

Click on one to resume it. If you don't see a Terminal window, go to the hamburger  menu in the top-left, and click on **Terminal > New Terminal**

You are limited to 5 active Codespaces on the free plan, but you can go in and delete any older Codespaces you're not using at any time.

## Using your Statamic CMS project in local dev

1. Have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed
2. Clone your newly created repo down to your computer
3. `cd` to your repo in your terminal
4. Get the project up and running with `make dev`
5. Wait until you see output like this, and then access the site via the credentials that are output on the console:

```
spin-up-statamic-queue-1  | ### Your Statamic site is ready!
spin-up-statamic-queue-1  | Frontend URL: http://localhost:8050/
spin-up-statamic-queue-1  | CP URL: http://localhost:8050/cp
spin-up-statamic-queue-1  | CP User: demo@statamic.com
spin-up-statamic-queue-1  | CP Password: password
```

Hit `Control-C` to terminate the project and spin down the containers

The first time you start up your project, it'll take some time to set everything up. However, subsequent startups will be very quick.

## Available `make` commands

This project uses `make` to execute various commands in the appropriate containers. Here's a list of available commands:

* `make dev` - Start the dev server
* `make artisan xxx` - Execute a `php artisan` CLI command in the PHP container
* `make composer xxx` - Execute a `composer` command in the PHP container
* `make npm xxx` - Execute an `npm` command in the PHP container
* `make please xxx` - Execute a `please` command in the PHP container
* `make statamic xxx` - Execute a `statamic` CLI command in the PHP container
* `make ssh` - Open up a shell in the PHP container

If the project is already running via `make dev` you can use a second terminal tab/window to execute additional commands.

## Adding to an existing Statamic project

You can use the [Start Up Statatmic starter kit](https://github.com/nystudio107/spin-up-statamic-starter) to add the Spin Up Scaffolding to your existing Statamic project.

## Creating your Statamic project

Develop the site as you normally would by editing templates, adding content, adding assets, etc.

Commit your changes to the repository.

People wanting to use the project will simply need to `git clone` the repo down, and get up and running with `make dev`

## Using Spin Up Statamic for support

If you're using Spin Up Statamic to try to replicate an issue someone else is having:

1. Clone a clean version of your repo down
2. Copy their `composer.json` and their `composer.lock` files to overwrite the project's respective files
3. Copy over any database files they have provided

Then start the project up with:
```
make dev
```

Usually the `composer.json`, `composer.lock`, and database files are all you need to replicate issues. But if additional config/template files are needed, obtain them as well.

## Random notes

- The `.env` file is created by copying `example.env` file when you start the project up
- The server will use the `INITIAL_SERVER_PORT` in the `.env` file for the initial port to start looking for unused ports from. It will increment it until it finds and unused port, and then use it
- If instead you want to used a fixed port, you can explicitly set the `DEV_SERVER_PORT` in the `.env` file
- The Docker containers will be named after the project directory, so give it a unique name for each project

## To Do

- Await orders from Jack

Brought to you by [nystudio107](https://nystudio107.com/)
