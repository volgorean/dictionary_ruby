
class Term
  @@terms = []

  def initialize
    @words = []
    @definitions = []
  end

  def words
    @words
  end

  def definitions
    @definitions
  end

  def add_word(word)
    @words << word
  end

  def add_def(definition)
    @definitions << definition
  end

  def Term.create(word, definition)
    new_term = Term.new
    new_term.words << word
    new_term.definitions << definition
    new_term.save
    new_term
  end

  def Term.all
    @@terms
  end

  def Term.clear
    @@terms = []
  end

  def Term.delete(index)
    @@terms.delete_at(index)
  end

  def Term.search(find_word)
    @@terms.each_with_index do |term, index|
      term.words.each_with_index do |word, ind|
        if word == find_word
          return term
        end
      end
    end
    false
  end

  def save
    @@terms << self
  end
end
