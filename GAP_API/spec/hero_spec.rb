require 'heroe'

RSpec.describe Heroe 
	context "testing heroes"
		it "tests hero fields"do
			@hero= Heroe.new(:name => "Hero1", :real_name => "HeroReal1", )

		end
end
	