# FLATIRON TWITTER CLI
_a command-line tool for tweeting @ Flatiron School_

This CLI is an extension of [sferik's t gem](https://github.com/sferik/t) that allows users to auto-follow all members of the current Flatiron Web Intensive class, as well as all current Flatiron Instructors. 

[Watch the demo.](https://asciinema.org/a/17177)

This project is very much still a work in progress. Please contribute by a) refactoring existing feature code and/or b) building out any of the ['pending' features listed below](#todo). 

## Installation
Run `bundle install` from terminal to install required gems.

## Configuration
You'll want to configure OAuth for Twitter's API first, so after you bundle, run `t authorize` and follow the instructions on-screen. If you run into any trouble, please refer to the full auth instructions [available on the t gem README](https://github.com/sferik/t#configuration).

## Initialization
Run `bin/run` from terminal to start the program.

## Commands
### Help
Type `help` to see a list of Flatiron-specific commands.  
Type `t help` to see a list of Twitter CLI commands.

### Follow
Type `follow`, then enter one of the subcommands below:  
 -- enter `students` to follow all current Flatiron students.  
 -- enter `instructors` to follow all current Flatiron instructors.  
 -- enter `all` to follow all current Flatiron students and instructors.  

### List
Type `list`, then enter one of the subcommands below:  
-- enter `students` to see a full list of current Flatiron students and their Twitter handles.  
-- enter `instructors` to see a full list of current Flatiron instructors and their Twitter handles.  
-- enter `all` to see a full list of current Flatiron students and instructors and their Twitter handles.  

### Twitter t gem commands
All valid [t gem](https://github.com/sferik/t) commands are available inside this CLI.  
Please refer to the [t gem documentation](https://github.com/sferik/t#usage-examples) for the full list of valid commands.

### Exit
Type `exit` to quit the CLI.

## Demo

<script type="text/javascript" src="https://asciinema.org/a/17177.js" id="asciicast-17177" async> </script>

##<a name="todo"/></a>To Do: Feature Builds / Refactoring
1) Add 'staff' feature to `list` and `follow` commands. A StaffScraper class is built, but currently returns all staff including instructors. Needs to be refactored to return non-instructor staff only.

2) Add `select class` feature so users can choose to list/follow other Flatiron School classes, like Ruby-006, ios-001, etc. Currently app can only be used with Ruby-007 students and instructors.

3) Scraper method refactoring. `StudentScraper` and `InstructorScraper` methods are not DRY; can probably be moved into a `Scrapable` module or something similar.

4) Improve load time upon initialization.

5) Fix open-uri RuntimeError:

```
/Users/ktmoney/.rvm/rubies/ruby-2.1.5/lib/ruby/2.1.0/open-uri.rb:231:in `open_loop': HTTP redirection loop: http://flatironschool.com/team (RuntimeError)
  from /Users/ktmoney/.rvm/rubies/ruby-2.1.5/lib/ruby/2.1.0/open-uri.rb:149:in `open_uri'
  from /Users/ktmoney/.rvm/rubies/ruby-2.1.5/lib/ruby/2.1.0/open-uri.rb:704:in `open'
  from /Users/ktmoney/.rvm/rubies/ruby-2.1.5/lib/ruby/2.1.0/open-uri.rb:34:in `open'
  from /Users/ktmoney/Documents/Documents/Flatiron/flatiron_projects/flatiron-twitter/lib/instructor_scraper.rb:7:in `call'
  from /Users/ktmoney/Documents/Documents/Flatiron/flatiron_projects/flatiron-twitter/lib/controllers/flatiron_twitter_cli.rb:8:in `initialize'
  from bin/run:5:in `new'
  from bin/run:5:in `main'
  ```

Happens inconsistently upon running `bin/run` command. Usually resolved by running `bin/run` command again.

6) Gemify. After the above kinks are ironed out, turn this little program into a legit gem.


### Credits
Built by [ktravers](https://github.com/ktravers). Inspired by [aviflombaum](https://github.com/aviflombaum) and [Stockvestigator3000](https://github.com/jeremysklarsky/stock-cli). Extended from [t gem](https://github.com/sferik/t).