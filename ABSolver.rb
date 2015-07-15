puts "Welcome to ABSolver, by Justin R. Daigle."
words = []
puts "Opening words.txt"
File.open("words.txt") do |f|
	while line = f.gets
		words << line.chomp.downcase
	end
end
puts "Loaded #{words.count} objects into words."
letters = []
puts "Enter the set of letters available to use, without any separation:"
letters_string = gets.chomp
letters_string.each_byte {|b| letters << b.chr.downcase}
puts "Set accepted. Available letters: #{letters}"
solutions = []
count = 1
puts "Checking against the dictionary. This has to do a lot of stuff, so give it a minute."
words.each do |word|
	word_letters = []
	word.each_byte {|b| word_letters << b.chr}
	usable_letters = letters.dup
	lcount = word_letters.count
	word_letters.each do |l|
		#puts "Usable letters: #{usable_letters}"
		break if usable_letters.index(l) == nil
		usable_letters.delete_at(usable_letters.index(l))
		lcount -= 1
		solutions << word if lcount == 0
	end
	#count += 1
end

solutions.sort! {|first, second| first.length <=> second.length }
puts "Possible solutions:"
solutions.each do |s|
	puts s
end