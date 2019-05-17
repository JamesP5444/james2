class HottestHotSauce::Scraper

def scrape_sauces
  @doc = Nokogiri::HTML(open("https://www.thedailymeal.com/eat/worlds-hottest-hot-sauces-gallery/slide-6"))
  @doc.css('div.slide-main').collect do |sauce|
    new_sauce = HottestHotSauce::Sauce.new
    new_sauce.name = sauce.css('h2').text.strip
    new_sauce.description = sauce.css('p').text.strip
    new_sauce.save
    end
  end



end





#
#   @doc.search('div.article-content-container').collect do |sauce|
#     new_sauce = HottestHotSauce::Sauce.new
#     new_sauce.name = sauce.css('h2').text.strip
#     new_sauce.description = sauce.css("p").text.strip
#     new_sauce.save
#   end
# end
# end
