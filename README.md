# Scopeater

Scopeater is nice way to deal with scopes.
It was created to :
 * simplify syntax
 * auto cache result

It wraps a content and auto-replaces it by methods result when matching eater taste.

More awesome, it already contains extensions for main ORMs :
 * ActiveRecord
 * Mongoid
 * MongoMapper

## Installation

Add this line to your application's Gemfile:

    gem 'scopeater'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scopeater

## Usage

### Base
Scopeater::Base captures method call return when matching given class

````.rb
	# Trival exemple with string
	module RubyOnRails; end
	s = Scopeater::Base.new RubyOnRails, String
	
	s.content
	# => RubyOnRails
	
	s.taste
	# => String
	
	s.to_s
	s.underscore += ' is cool'
	s.gsub('_', ' ')
	s.class
	# => Scopeater::Base
	
	s.content
	# => "ruby on rails is cool"
	
	s.split(' ')
	# => ["ruby", "on", "rails", "is", "cool"]
````

Be convention taste is initial content class

````.rb
	Scopeater::Base.new("a string").taste
	# => String
````

Shorter

````.rb
	Scopeater.eat "a string"
````

### Mongoid

````.rb
	class PostsController < ApplicationController
		before_filter :scope_pagination
		before_filter :scope_rights

		def index
		end
	
	protected
		def scope
			@_scope ||= Mongoid::Scopeater.new(User).desc(:created_at)
		end

		def scope_pagination
			scope.limit(params[:limit]) if params[:limit]
			scope.skip(params[:offset]) if params[:offset]
		end
		
		def scope_rights
			scope.where(public: true) unless user_signin?
		end
	end
	
	# in index.html.haml
	
	#posts= render collection: scope.entries
````

And even shorter

````.rb
	User.scopeater
	User.desc(:created_at).scopeater
````

### Other ORMS

I created similar scopeater for listed ORM.
I didn't test them because I don't use them anymore ...

But if you meet issue then post on github.
And if you write specs/fix it you can contribute.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
