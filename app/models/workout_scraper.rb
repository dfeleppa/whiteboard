class WorkoutScraper
    require "nokogiri"
    require "httparty"
    require "pry"

    def scrape
        url = "https://www.crossfitinvictus.com/wod/may-26-2020-performance/"
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(parsed_page)
        parsed_page
        binding.pry
    end

    scrape

end