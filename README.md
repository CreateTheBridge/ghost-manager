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

Command: ghost init
Params:
+ Directory to install Ghost to
+ Name of the theme

```
$ ghost init ~/Applications/Ghost magneto
```



Using Ghost Manager is dead simple. Using the "ghost" command, select from the menu and continue with on-screen instructions.

Console:
```
$joshuat ghost
Welcome to Ghost Manager, created by Create the Bridge

1. Install Ghost
2. Update Ghost Install
3. Generate Theme
What do you want to do?
```

It's important to note that you must have git and npm installed for this gem to function properly.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CreateTheBridge/ghost-manager.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
