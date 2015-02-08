# nim-fuse

A FUSE Binding for Nim

### Browse API

https://rawgit.com/akiradeveloper/nim-fuse/master/fuse.html

### Design based on Rust-fuse

The design of this binding is based on rust-fuse.
rust-fuse supports Linux and OSX so nim-fuse will catch up too.

### Why Nim?

Nim is high-performance but even safer than C.
That's all. Everyone loves speed.

### Todo

* Make a filesystem just backed by an other mountpoint
  (usage: backedfs ./mntA ./mntB) that only sends request 
  to the backing fs. Testing on the filesystem can test 
  this library with high coverage.  
* I need Option type in the stdlib so that I remove
  handmaded one from this library.  
* Send this to upstream stdlib so people can reach
  more easily.  
* MacOSX test.  
* Travis setup.  

## Travis

Still stub test 

[![Build Status](https://travis-ci.org/akiradeveloper/nim-fuse.svg)](https://travis-ci.org/akiradeveloper/nim-fuse)

### Author

Akira Hayakawa

This is my first nim project.
I think there are lot of things remained to improve.
Feel free to comment or send pull request.
