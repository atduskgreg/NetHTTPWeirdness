#
#  AppDelegate.rb
#  NetHttpWeirdness
#
#  Created by Greg Borenstein on 6/4/11.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

require 'net/http'

class AppDelegate
    attr_accessor :window
    def applicationDidFinishLaunching(a_notification)
        
        url = URI.parse("http://www.instapaper.com/api/add")
        req = Net::HTTP::Post.new(url.path)
        req.basic_auth "borenstein@fastmail.fm", "test"
        
        t = NSString.new 
        u = NSString.new 
        
        # swap these with ruby instances of String and it starts to work
        # t = "I'm writing a book!"
        # u = "http://urbanhonking.com/ideasfordozens/2011/05/31/making-things-see-a-book-for-oreilly-about-the-kinect/"
        
        req.set_form_data({'title' => t, 'url' => u})
        
        Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
       
        
    end
end

