# graph-git
Graph the lines of code count of a Git repository over time.

<p align="center">
<img src="https://raw.githubusercontent.com/berpj/graph-git/master/demo/docker.png" width="47%" />
<img src="https://raw.githubusercontent.com/berpj/graph-git/master/demo/go.png" width="47%" />
<img src="https://raw.githubusercontent.com/berpj/graph-git/master/demo/code-civil.png" width="47%" />
<img src="https://raw.githubusercontent.com/berpj/graph-git/master/demo/bootstrap.png" width="47%" />
</p>

##Requirements

- imagemagick
- ruby
- bundler
- rake

## Installation

- `bundle install`
- `rake install`

## Usage

`./bin/graph-git --git-clone-url <git clone url> --output-path <output path>`

Example: `./bin/graph-git --git-clone-url git@github.com:docker/docker.git --output-path docker.png`

## License
```
The MIT License (MIT)

Copyright (c) 2015 Pierre-Jean Bergeron

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
