# Hubot: hubot-coprhd

[![Build Status](https://travis-ci.org/victorock/hubot-coprhd.svg?branch=master)](https://travis-ci.org/victorock/hubot-coprhd)

Operate and provision storage infrastructure through ChatOps.


## Installation

Add **hubot-coprhd** to your `package.json` file:

```
npm install --save hubot-coprhd
```

Add **hubot-coprhd** to your `external-scripts.json`:

```json
["hubot-coprhd"]
```

Run `npm install`

## Auth

Access Control with [hubot-auth](https://github.com/hubot-scripts/hubot-auth).

- User with `admin` or the role defined `HUBOT_COPRHD_ROLE` can run all commands.

```ruby
# against user without a valid role
hubot> hubot coprhd cli exec
You cannot access this feature. Please contact an admin.
```

- Use HUBOT_COPRHD_DEV to disable access control and dependency validation.

```ruby
export HUBOT_COPRHD_DEV="true"
```

## Todo

- Make user interface more human friendly (See: [src](example/src)).
- Create Docker image (See: [docker](example/docker)).
- Encapsulate the cli as object (See: [lib](example/lib).

## License

The MIT License (MIT)

Copyright (c) 2017 Victor da Costa

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Support

Please file bugs and issues at the Github issues page. For more general discussions you can contact the Dell EMC Code team. The code and documentation are released with no warranties or SLAs and are intended to be supported through a community driven process.
