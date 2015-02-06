require "mechanize"



agent = Mechanize.new 

page = agent.get("http://steveblank.com/secret-history/")
agent.user_agent = "Chrome"

links = page.links

links.each do |valley|
		if valley.href.to_s.include?("amazon")
			amazon_links = []
			amazon_links << valley.href 
			amazon_links.each do |link_ama|
				clean_links = []
				if link_ama.start_with?("http://www.amazon")
					clean_links << link_ama
				if !link_ama.start_with?("http://www.amazon")
					clean_links.push(link_ama.slice(link_ama.index("/gp")...-1))
					puts clean_links
				end 
			end
				
				# if link_ama.to_s.start_with?("http://amazon")
				# 	puts link_ama
					# fixed_links = link_ama.slice(link_ama.index("/gp")...-1).insert(0, "http://amazon")
					# new_links << fixed_links
				
			end
 		end
end 