# Boilerplate
Lorem ipsum

## Roadmap

* Write custom template render logic
* Each content-page has an template file and an optional data (JSON) file.
*

## Tools, languages and techniques

### Tools
* [Gulp](http://gulpjs.com/)
* [AutoPrefixer](https://github.com/postcss/autoprefixer)
* [Node.JS](https://nodejs.org)
* [BrowserSync](browsersync.io)

### Languages
* HTML
* Javascript
* [SWIG](http://paularmstrong.github.io/swig/)
* [SASS](http://sass-lang.com/)

### Libraries
* [Conditioner](http://conditionerjs.com)
* [RequireJS](http://requirejs.org)
* [Modenrizr](http://modernizr.com)

### Conventions
* [BEM](https://css-tricks.com/bem-101/)
* [Content First]

## Installation

First make sure you've got Ruby and NodeJS installed. Then proceed as follows:

* Install Gulp (`npm install gulp`)
* Install SCSS_Lint (`gem install scss_lint`)
* Install all packages defined in package.json (`npm install`)

### Troubleshooting

You might run into certificate problems on Windows. Try the information [this url](https://gist.github.com/luislavena/f064211759ee0f806c88#step-1-obtain-the-new-trust-certificate), that should take care of it :)

## Terms

### Utils

Put your generic utilities here. An utility should most of the time do something with the data it receives as input

- SASS mixins
- SASS functions
- JavaScript utilities like Observer, Mediator, ...
- ...

### Settings

Put your configuration for your module/components here.

- Configuration for Conditioner
- Configuration for Require
- Configuration for breakpoints in SASS
- Configuration for colors in SASS
- ...

### Base

The starting point of your module. Most of the time this will probably be empty, except for the `base`-module.

- Normalize.css
- Global `box-sizing` declarations
- `::selection`
- Site-wide behaviour, e.g. adding `target=_blank` to all external links.

### Generic

The initial layer of setting up your module. Most of the time this will probably be empty, except for the `base`-module.
For SASS, there should be no classes here, only element (`h1 {}`, attribute (`[title] {}`) and/or pseudo-selectors (`:hover {}`).

- Default styling for all elements (`h1`, `p`, `ul` etc.).

### Objects

Objects are the lowest level building blocks for your components.

An object should only do 1 thing. Therefore an object should only exist in 1 language.

- SASS: A class or mixin for removing the default styling (bullets etc.) from a list
- SASS: A class or mixin for displaying list-items inline
- SASS: A class or mixin for boxes
- JavaScript: Interface-like objects
- JavaScript: Models (?)
- ...

### Components

Component are building blocks for modules. A component can have its own CSS, JavaScript, HTML etc.

- Buttons
- Form-element
- Share-component
- Link-list
- ...

### Modules

A module is usually a bigger part of your application and will contain multiple components. Only module specific code should be here.

- Header
- Footer
- Filter
- Search
- ...

### Trumps

A trump is a playing card which is elevated above its normal rank in trick-taking games ([Wikipedia](https://en.wikipedia.org/wiki/Trump)). Use trumps to make sure classes like `.hide`, `.screenreader` etc are at the bottom of your CSS output so that they are not overwritten by other code!

## Directories

### Roots

Paths can be configured in `gulp.config.js`.

* `roots.src` is the source directory you are working in.
* `roots.www` is the output of the `gulp initial`-task your project which will be running in a webserver
* `roots.tmp` is used for writing temporary files (right now only used for Swig)
* `roots.dest` is the output of the `gulp build`-task.

### Modules

We bundle files (SCSS, JavaScript, Swig, ...) together based on components/modules in the `src`-folder. The output will look more familiar, with pretty much everything output to a `static`-folder.

#### JavaScript

In the `roots.src`-folder, all JavaScript should be in the `modules`-folder. Site-wide, generic modules should be in `modules/base`.

The subfolders in the `modules/base/js`-folder are prefixed with numbers to make clear how everything should be structured. These numbers are stripped from the directory-names when compiling. The `/js/`-subfolder for each module is also stripped:

- `src/modules/base/js/00-vendor` becomes `www/static/js/base/vendor`
- `src/modules/moduleX/js/moduleX` becomes `www/static/js/module/moduleX`

etc.

##### RequireJS

RequireJS loads everything from the `/static/js`-folder, meaning that dependencies should be loaded as follows:

- `src/modules/base/js/00-vendor` becomes `base/vendor`
- `src/modules/moduleX/js/moduleX` becomes `module/moduleX`

#### SCSS

For now, all the SCSS is merged into one single file. In the future it might be necessary to output separate files for modules.
This would however only be necessary when modules become (too) big.

The subfolders in the `modules/base/scss`-folder are prefixed with numbers to make clear how everything should be structured.

## Swig

We use Swig as our templating engine, for both pages and components.

- Before compiling the pages in the `prototype`-folder, all `.swig`-files in the `modules` folder are compiled. This allows us to use separate data-files for each component.
- Swig requires relative `extends` paths. To enable us to use nesting in the `prototype`-folder, these files are dynamically added when compiling the templates. You only need to include the layout-name you want to use from the `layouts`-folder.

### Data
- Site-wide data (e.g. dictionary items etc) can be configured in the `data` folder. Its contents will be available in your `.swig`-files via `data.filename`, so `dictionary.json` becomes `data.dictionary`.
- For each `.swig` file you can include a `.json` file with the same name. Its contents will be added to the site-wide data described above on the local-property of the JSON object (`data.local`).

## Gulp

We use Gulp as a task-runner to automate tasks. The following tasks can be used:

### gulp initial

Before starting work, run `gulp initial` to prefill the output directory. Only pre-existing files can be watched.

### gulp dev

Run `gulp dev` to watch for file changes and start BrowserSync.

### gulp build

Run `gulp build` after running `gulp dev` to copy the `src`-directory to the `dest`-directory.

### gulp deploy

Uploads the /build/ directory to the configured FTP-server.

## Misc

### Favicons

Favicons can be generated at http://realfavicongenerator.net/. They should be put in /src/static/img/.