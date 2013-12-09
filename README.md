growl_windows
=============

Make gem `growl` support windows.
As you could have known, gem `growl` only support MacOS. 

To solve the problem on Windows, gem `growl_windows` come out, which has same syntaxes with gem `growl`!

# Install

First, you must install software [Growl for windows](http://www.growlforwindows.com/gfw/) .

And then:

    gem install growl_windows

That's all, you can enjoy it!

# Usage

    require 'growl_windows'
    Growl.notify("Hello Windows", title: "Growl Test")

If it print some error like this:

    # Find growl path from registry failed!
    #  You can use e.g. Grow.register_binpath('C:\Program Files\Growl for windows\growlnotify.exe') before notifying.

You can do this with growl installation path of yourself:

    require 'growl_windows'
    Growl.register_binpath('C:\Program Files\Growl for windows\growlnotify.exe')
    Growl.notify("Hello Windows", title: "Growl Test")

OK, other options is supported same as gem `growl`, you can find it from it's [homepage](https://github.com/visionmedia/growl).



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/growl_windows/debbbbie.github.io/trend.png)](https://bitdeli.com/free "Bitdeli Badge")


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/debbbbie/growl_windows/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

