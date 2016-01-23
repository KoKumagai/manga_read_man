# MangaReadMan

MangaReadMan is a Ruby library for extracting image urls from mangareader ( http://www.mangareader.net ).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'manga_read_man'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install manga_read_man

## Usage

```rb
# syntax: MangaReadMan.image_urls(title, chapter)

# any chapter
MangaReadMan.image_urls('one-piece', 3)
=>[
   { 3=>[
         "http://i9.mangareader.net/one-piece/3/one-piece-1668214.jpg",
         "http://i1.mangareader.net/one-piece/3/one-piece-1668215.jpg",
         "http://i5.mangareader.net/one-piece/3/one-piece-1668216.jpg",
         ...
        ]
   }
  ]

# some chapters
MangaReadMan.image_urls('one-piece', 5..7)
=>[
   { 5=>[
         "http://i5.mangareader.net/one-piece/5/one-piece-2420145.jpg",
         "http://i7.mangareader.net/one-piece/5/one-piece-2420147.jpg",
         "http://i3.mangareader.net/one-piece/5/one-piece-2420149.jpg",
         ...
        ]
   },
   { 6=>[
         "http://i2.mangareader.net/one-piece/6/one-piece-2420187.jpg",
         "http://i4.mangareader.net/one-piece/6/one-piece-2420189.jpg",
         "http://i6.mangareader.net/one-piece/6/one-piece-2420191.jpg",
         ...
        ]
   },
   { 7=>[
         "http://i7.mangareader.net/one-piece/7/one-piece-2420231.jpg",
         "http://i7.mangareader.net/one-piece/7/one-piece-2420233.jpg",
         "http://i5.mangareader.net/one-piece/7/one-piece-2420235.jpg",
         ...
        ]
   }
  ]

# all chapters
MangaReadMan.image_urls('one-piece')
=>[
   { 1=>[
         "http://i9.mangareader.net/one-piece/1/one-piece-1668160.jpg",
         "http://i5.mangareader.net/one-piece/1/one-piece-1668161.jpg",
         "http://i3.mangareader.net/one-piece/1/one-piece-1668162.jpg",
         ...
        ]
   },
   { 2=>[
         "http://i9.mangareader.net/one-piece/2/one-piece-2420099.jpg",
         "http://i7.mangareader.net/one-piece/2/one-piece-2420101.jpg",
         "http://i5.mangareader.net/one-piece/2/one-piece-2420103.jpg",
         ...
        ]
   },
   { 3=>[
         "http://i9.mangareader.net/one-piece/3/one-piece-1668214.jpg",
         "http://i1.mangareader.net/one-piece/3/one-piece-1668215.jpg",
         "http://i5.mangareader.net/one-piece/3/one-piece-1668216.jpg",
         ...
        ]
   },
   { 4=>[
         "http://i1.mangareader.net/one-piece/4/one-piece-1668229.jpg",
         "http://i3.mangareader.net/one-piece/4/one-piece-1668231.jpg",
         "http://i5.mangareader.net/one-piece/4/one-piece-1668233.jpg",
         ...
        ]
   },
   { 5=>[
         "http://i5.mangareader.net/one-piece/5/one-piece-2420145.jpg",
         "http://i7.mangareader.net/one-piece/5/one-piece-2420147.jpg",
         "http://i3.mangareader.net/one-piece/5/one-piece-2420149.jpg",
         ...
        ]
   },
   ...
  ]

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/KoKumagai/manga_read_man/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
