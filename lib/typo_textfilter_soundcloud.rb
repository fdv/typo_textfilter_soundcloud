class Typo
  class Textfilter
    class Soundcloud < TextFilterPlugin::MacroPost
      plugin_display_name "Lightbox"
      plugin_description "Automatically generate tags for images displayed in a lightbox"

      def self.help_text
        %{
You can use `<typo:soundcloud>` to display a player from [Soundcloud](http://soundcloud.com) 
      
Example:
  <typo:soundcloud url="http://soundcloud.com/das-boy/1993-12-31-essential-mix-brothers-in-rhythm-new-years-mix" />
  <typo:soundcloud url="soundcloud.com/das-boy/1993-12-31-essential-mix-brothers-in-rhythm-new-years-mix" width="280px" height="51px" comments="false" />

This plugin takes a number of parameters:
* width: the player width, in pixels, default is 100%.
* height: the player height, in pixels, default is 81.
* url: the url to a soundcloud public file.
* comments: display the comments on the player, default is true.
* auto_play: obvious. Default is false.
* color: an hexa triplet for the play button color. Default is orange.
}
      end

      def self.macrofilter(blog,content,attrib,params,text="")
        width         = attrib['width'].nil? ? '100%' : attrib['width']
        height        = attrib['height'].nil? ? '81' : attrib['height']
        url           = attrib['url']
        comments      = attrib['comments'].nil? ? 'true' : attrib['comments']
        auto_play     = attrib['auto_play'].nil? ? 'false' : attrib['auto_play']
        color         = attrib['color'].nil? ? 'CC6633' : attrib['color']

        %{<object height="#{height}" width="#{width}"><param name="movie" value="http://player.soundcloud.com/player.swf?url=#{url}&amp;show_comments=#{comments}&amp;auto_play=#{auto_play}&amp;color=#{color}"><param name="allowscriptaccess" value="always"><embed allowscriptaccess="always" height="#{height}" src="http://player.soundcloud.com/player.swf?url=#{url}&amp;show_comments=#{comments}&amp;auto_play=#{auto_play}&amp;color=#{color}" type="application/x-shockwave-flash" width="#{width}"></object>}
      end
    end
  end
end
