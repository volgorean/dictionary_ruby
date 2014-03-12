# require 'rspec'
# require 'term'


# describe Term do
#   before do
#     Term.clear
#   end
#   it 'initializes the Term class' do
#     test_term = Term.new('cake', 'A yummy baked good.')
#     test_term.should be_an_instance_of Term
#   end
#   describe 'save' do
#     it 'saves the term & description to our terms arry' do
#       test_term = Term.new('ninja', 'A shadow warrior')
#       test_term.save
#       Term.all.length.should eq 1
#     end
#   end
#   describe '.delete' do
#     it 'deletes a term at specific index' do
#       test_term = Term.create('samurai',['feudal warrior'])
#       test_term2 = Term.create('ninja', ['shadow warrior'])
#       Term.delete(0)
#       Term.all.should eq [test_term2]
#     end
#   end
#   describe '.create' do
#     it 'creates a new term and initializes it' do
#       test_term = Term.create('bunny', ['fluffy thing'])
#       test_term.should be_an_instance_of Term
#     end
#     it 'saves a new term to the term class variable' do
#       test_term = Term.create('coffee', ['is awesome'])
#       Term.all.should eq [test_term]
#     end
#   end
#   describe '.edit' do
#     it 'edits a term' do
#       test_term = Term.create('bunny', ['fluffy thing'])
#       test_term.edit('bunny', ['a delicious stew'])
#       test_term.definition.should eql ['a delicious stew']
#     end
#   end
#   describe '.search' do
#     it 'searches by term name and returns that term object' do
#       test_term = Term.create('deer', 'venison')
#       test_term2 = Term.create('bear', 'honey')
#       Term.search('bear').should eq test_term2
#     end
#   end
# end
