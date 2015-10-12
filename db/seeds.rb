class DatabaseSeeder

	def self.seed_tags
		Tag.create!(name: "Tech")
		Tag.create!(name: "Food")
		Tag.create!(name: "Travel")
		Tag.create!(name: "Finance")
	end
end

DatabaseSeeder.seed_tags