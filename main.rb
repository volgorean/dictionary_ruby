require './lib/term'

def main_menu
  system('clear')
  puts 'Welcome to your Dictionary!'
  puts 'Enter "a" to add a term!'
  puts 'Enter "l" to list the dictionary!'
  puts 'Enter "s" to search for a term by name!'
  puts 'Enter "x" to exit!'
  case gets.chomp[0]
  when 'a'
    add_menu
  when 'l'
    list_menu
  when 's'
    search_menu
  when 'x'
    exit
  else
    puts "That is not a valid input!!!!"
    main_menu
  end
end

def add_menu
  system('clear')
  puts "Enter the name of your term:"
  term_name = gets.chomp
  puts "Enter the description of your term:"
  term_desc = gets.chomp
  new_term = Term.create(term_name, term_desc)
  def_add_menu(new_term)

  puts 'Enter "a" to add another term'
  puts 'Enter "x" to go back to main menu'
  if gets.chomp[0] == 'a'
    add_menu
  else
    main_menu
  end
end

def def_add_menu(term)
  puts "Do you want to add more definitions? Enter y/n"
  if gets.chomp[0] == 'y'
    puts "Enter new definition:"
    user_def = gets.chomp
    term.add_def(user_def)
    def_add_menu(term)
  else
    main_menu
  end
end

def list_menu
  system('clear')
  puts "*****************************"
  Term.all.each_with_index do |term, index|
    puts (index+1).to_s + ". " + term.words[0] + ": '" + term.definitions[0] + "'"
  end
  puts "*****************************"
  puts 'enter "d" to delete a term'
  puts 'enter "t" to view details of a term'
  puts 'enter "e" to edit a term'
  puts 'enter "x" to go back to the main menu'
    case gets.chomp[0]
    when 'x'
      main_menu
    when 't'
      term_menu
    when 'd'
      puts 'Enter number of term you want to delete'
      user_delete = gets.chomp
      Term.delete(user_delete.to_i - 1)
      list_menu
    when 'e'
      edit_menu
    else
      main_menu
    end
end

def edit_menu
  puts 'Enter number of term you want to edit'
  user_edit = gets.chomp
  term = Term.all[user_edit.to_i - 1]
  puts 'Enter "n" to edit term name'
  puts 'Enter "d" to edit term definition'
  case gets.chomp[0]
  when 'n'
    puts 'Enter new name:'
    new_name = gets.chomp
    term.words[0] = new_name
  when 'd'
    term.definitions.each_with_index do |d, i|
      puts (i+1).to_s + ". " + d
    end
    puts 'Enter number of the definition you want to edit:'
    def_edit = gets.chomp.to_i - 1
    puts 'Do you want to edit("e") or delete("d") this definition?'
    case gets.chomp[0]
    when 'e'
      puts 'Enter new definition:'
      new_def = gets.chomp
      term.definitions[def_edit] = new_def
    when 'd'
      term.definitions.delete_at(def_edit)
    else
      main menu
    end
  end
  list_menu
end

def search_menu
  system('clear')
  puts 'enter the word you wish to search for'
  word_to_search = gets.chomp
  found_word = Term.search(word_to_search)
  if found_word == false
    puts "Your word was not found! Sorry!"
  else
    system('clear')
    puts "*******************************************"
    puts "Here is your result!"
    puts found_word.words[0] + ":"
    found_word.definitions.each_with_index do |defin, index|
      puts (index+1).to_s + ". '#{defin}'"
    end
    puts "*******************************************"
  end
  puts "\n"
  puts "Enter 's' to search again."
  puts "Enter 'x' to go back to main menu."
  case gets.chomp[0]
  when 's'
    search_menu
  else
    main_menu
  end
end

def term_menu
  puts "enter the number of the term you would like to view: "
  what_to_view = gets.chomp
  system('clear')
  word_to_view = Term.all[what_to_view.to_i - 1]
  puts word_to_view.words[0]
  puts "***************************************"
  word_to_view.definitions.each_with_index do |defin, index|
    puts (index+1).to_s + ". '#{defin}'"
  end
  puts "***************************************"
  puts "enter x to return to list"
  puts gets.chomp
  list_menu
end



main_menu











