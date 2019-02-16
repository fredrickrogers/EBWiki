# Developing EBWiki with Vagrant

These instructions will help you get the EBWiki application up and running on your local workstation with Virtualbox and Vagrant.

## Prerequisites

You'll need to have the following items in place to proceed.

### A System Terminal

You will need to access your the terminal program for your operating system.  Use the steps below to open the default system terminal for your OS: 

* *Windows*: Click "Start > Program Files > Accessories > Command Prompt" 

* *macOS*: Open a new Finder window and click "Applications > Utilities".  Double click "Terminal"

* *Linux*: Opening your linux terminal varies based on distribution.  Here a are few...
  * *Ubuntu*: 
  * *Fedora*: 

### Git
You will need Git installed to access the EBWiki code repository and collaborate with other developers working on the project.

The following article from Linode.com provides instructions for installing git on Windows, macOS, and Linux operating systems:

* [How to Install Git on Linux, Mac or Windows
](https://www.linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/)

After installing Git, test the installation by running the following command from a terminal: `git --version`.

You should see output similar to the following:

```
git --version
git version 2.20.1
```

### VirtualBox
You will need a recent version of VirtualBox installed to run the EBWiki virtual machine. Open the the VirtualBox download page, select the package that matches your operating system, and follow the installation instructions.

* [Download VirtualBox](https://www.virtualbox.org/wiki/Downloads) 

After installing VirtualBox, test the installation by running the following command from a terminal: `VBoxHeadless --version`

You should see output similar to the following:

```
VBoxHeadless --version
Oracle VM VirtualBox Headless Interface 6.0.4
(C) 2008-2019 Oracle Corporation
All rights reserved.

6.0.4r128413
```

### Vagrant
You will need a recent version of Vagrant installed to manage the EBWiki virtual machine. Open the Vagrant download page, select the package that matches your operating system, and follow the installation instructions.

* [Download Vagrant](https://www.vagrantup.com/downloads.html)

After installing Vagrant, test the installation by running the following command from a terminal: `vagrant --version`

You should see output similar to the following:

```
vagrant --version
Vagrant 2.2.3
```

## Check out the EBWiki Code

With Git, VirtualBox, and Vagrant installed, you're ready to check out the EBWiki code.

Run the following commands in your terminal to clone and move into the EBWiki repository:

```
git clone git@github.com:EBWiki/EBWiki.git
cd EBWiki
```

## Start the EBWiki Virtual Machine

Run the following command from inside the EBWiki repository:

```
vagrant up
```

This will start the EBWiki virtual machine and provision it with the application.  Provisioning may take from 5 to 10 minutes depending on the speed of your network connection.

After provisioning is complete, open the following link in your browser:

[http://192.168.68.68](http://192.168.68.68)

You should be presented with the EBWiki site, similar to the image below:

