require 'open-uri'
require 'nokogiri'

class Yopmail

	def parse_yopmail_inbox(userid,ticket_subject)
		begin
			parsed_page = Nokogiri::HTML(open("http://www.yopmail.com/en/inbox.php?login=#{userid}&p=1&d=&ctrl=&scrl=&spam=true&yf=003&yp=MZmt4ZmVmAwLkZGplAwtmAt&yj=VAmt1ZGpkAGN3ZmL1AGD0Zj&v=2.6&r_c=&id="))
			parsed_page = parsed_page.xpath("//span[@class='lms']")
			parsed_page.each do |ticket|
				puts ticket.text.class
				if ticket.to_s.include? ticket_subject
					return true
				end
			end
			return false
		rescue Exception => e 
			puts e.message
		end
	end
end

obj = Yopmail.new

p obj.parse_yopmail_inbox("chan12345","Ticket Received - scdsf")