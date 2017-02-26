# Demo project from HTML5 Dart library

Demo project for [HTML5](https://github.com/dam0vm3nt/html5) library.


## How to test it

At the moment this library only works on `DDC` and with `polymerize`. It will be eventually ported to `dart2js` and to `dazel`.

To build the sample demo just follow these instructions:

 1. install `polymerize`

     `pub global activate polymerize`

 2. prepare the project

     `polymerize init`

 3. build it with bazel

     `bazel build html5_demo`

The build result will be in the `bazel-bin` folder from where you can serve with your favourite server, for instance:

    cd bazel-bin
    python -m SimpleHTTPServer 8000

## Caveats

Tested only for `chrome`. Firefox should work apart from some support for html import that's still missing.
