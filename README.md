# Ghost Manager

Ghost Manager is a Ruby command line utility to augment the process of installing Ghost, a popular blogging platform (https://ghost.org), and developing themes.

Ghost Manager utilizes Atom, a smart text editor created by Github (http://atom.io), to edit theme files.

## Dependencies

Ghost Manager requires the user to have NPM (Node Package Manager) installed on their system to execute commands. Learn more at https://www.npmjs.com

Ghost Manager requires the user to have the ghost-interface Yeoman generator installed.  Learn more about ghost-interface on it's github page: https://github.com/CreateTheBridge/generator-ghost-interface

## Installation

Install Ghost Manager via https://rubygems.org.
```
gem install ghost-manager
```

## Usage

Ghost Manager can be used several ways:

An easy-to-use menu interface which can be accessed by simply entering:
```
$ ghost

Welcome to Ghost Manager, created by Create the Bridge

1. Initialize a new Ghost project
2. Create Ghost install
3. Update Ghost
4. Create Ghost theme
5. Run Ghost server
6. Launch dev suite
What do you want to do?

```

Regular command interface with command line arguments:

Ghost Manager will ask for install directory and theme name if not provided.

*Command*: ghost init

*Description*: Initializes a new ghost project in the current directory, while giving you the option to install ghost elsewhere.

*Params*:
+ (optional) Directory
+ (optional) Theme name

```
$ ghost init ~/Applications/Ghost magneto
```

*Command*: ghost install

*Description*: Installs ghost to the given directory

*Params*:
+ (optional) Directory

```
$ ghost install ~/Applications/Ghost
```

*Command*: ghost theme

*Description*: Creates a new theme in the current directory, requires a ghostfile

*Params*:
+ (optional) Theme name

```
$ ghost theme magneto
```

*Command*: ghost dev

*Description*: After ghost has been installed and a theme created, this will launch the ghost server and an instance of Atom to start developing your them. Requires a ghostfile

```
$ ghost dev
```

*Command*: ghost server

*Description*: After Ghost has been installed, this will launch the ghost server. Requires a ghostfile

```
$ ghost server
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CreateTheBridge/ghost-manager.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
