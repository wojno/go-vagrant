# go-vagrant

[Go](http://golang.org/) has been around for SIX years now!?  I've been curious about checking out `Go` for awhile now and decided what better way to experiment than by using a `Vagrant-ized` environment.  

## Motivation

This project provides `Go-in-a-box` for quick testing and development - an easy way to get started with `Go development` using `Vagrant`, in addition to offering several other helpful Go utilities and plugins.

## Requirements
 
* [Vagrant](https://www.vagrantup.com)
* [VirtualBox](https://www.virtualbox.org/)

## Getting started

To get started, simply clone the repo and then perform the following:

    $ cd /path/to/repo
    $ vagrant up
    ...
    $ vagrant ssh
    vagrant@go:~$ # develop
    vagrant@go:~$ # profit

## Usage

Once the environment is provisioned and you can `SSH` into the host using `vagrant ssh`.

### Run example code using `go get`

    $ cd ~/workspace
    $ go get github.com/golang/example/hello 
    $ ls src/github.com/golang/example/
      appengine-hello  hello  LICENSE  outyet  README.md  stringutil
    # build the example
    $ go build github.com/golang/example/hello
    # run the example
    $ hello
      Hello, Go examples!


## Contributors

Any and all input is welcome.  Feel free to add features through pull requests or note any issues you may encounter.

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).
