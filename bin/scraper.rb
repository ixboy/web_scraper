#!/usr/bin/env ruby
require_relative '../lib/pagination'
require_relative '../lib/utils'
scraper = Pagination.new
scraper.run
Utilities.thanks
