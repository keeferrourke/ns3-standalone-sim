# NS-3 Standalone Simulations

Developers who are new to working with the `ns-3` network simulator may find it strange that all the
official documentation suggests that any work you want to do should be done directly in the
`scratch/` directory of the `ns-3` source.

This project is an attempt to demonstrate a project structure which allows one to decouple their
custom simulation code from the `ns-3` source distribution.

A Makefile is used for demonstration purposes, but any build tool should be easily adopted
to develop ns-3 simulations using this project structure.

# How to use this

First, obtain a source-distribution of `ns-3`. This can be done with the `bake` tool.
Install `bake` as per the instructions in the
[BAKE tutorial](https://www.nsnam.org/docs/bake/tutorial/html/bake-tutorial.html).

Once bake is installed and on your PATH, run the following:

```sh
bake.py configure -e ns-3.32 --sourcedir="$(pwd)/ns3-src" --installdir="$(pwd)/ns3-dist
bake.py download
bake.py deploy
```

This will instruct bake to download the sources for `ns-3.32` to the `ns3-src` sub-folder of your
current directory, and to compile the library objects to the `ns3-dist` sub-folder of your current
directory.

Place any C++ source files in the `src/` and `include/` directories.

Next, edit the `Makefile` to suit your project needs.

Run `make && make run` to run your simulation as a standalone executable, independent of ns-3's
`waf` build tool.

# Limitations

The `waf` build tool included in ns-3 distributions does a lot of heavy lifting to configure
the ns-3 runtime with environment variables.

To use a standalone executable like this, you'll need to set the appropriate environment variables
yourself.

# License

The source code in this repository is dual-licensed under the ISC License and the GNU General Public
License v2, as appropriate. See the `LICENSE` files under the sub-directories of this repository for
more details.
