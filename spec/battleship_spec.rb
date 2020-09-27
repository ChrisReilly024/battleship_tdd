# require 'battleship'
# require 'rspec'

# describe "battleship checker" do
#     describe "checker" do
      
#         it "should return false if the ship starting at 0,0 borders another ship horz or vertic" do
#             expect(checker([[1,1,0,0,0,0,0,0,0,0],[1,0,0,0,0,0,0,0,0,0]])).to eq(false)
#         end
#         it "should return false if the ship starting at 0,0 borders another one on the corner" do
#             expect(checker([[1,0,0,0,0,0,0,0,0,0],[0,1,0,0,0,0,0,0,0,0]])).to eq(false)
#         end
#         it "should return true if a vetical ship starting at 0,0 borders no other ship" do
#             expect(checker([[1,1,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(true)
#         end
#         it "should return true if i == 0 and a horizontal ship borders no other ship" do
#             expect(checker([[0,0,0,0,1,1,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(true)
#             expect(checker([[0,0,0,0,0,0,1,1,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(true)
#         end
#         it "should return false if i == 0 and a horiz ship borders a ship below" do
#             expect(checker([[0,0,0,0,0,1,1,0,0,0],[0,0,0,0,0,0,1,0,0,0]])).to eq(false)
#             expect(checker([[0,0,0,0,0,1,1,0,0,0],[0,0,0,0,0,1,0,0,0,0]])).to eq(false)
#         end
#         it "should return true if i == 0 and a horiz ship borders no ship below" do
#             expect(checker([[0,0,0,0,0,1,1,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(true)
#             expect(checker([[0,0,0,0,0,0,0,0,1,1],[0,0,0,0,0,0,0,0,0,0]])).to eq(true)
#         end
#         it "should return false if i == 0 and a horiz ship borders a ship below" do
#             expect(checker([[0,0,0,0,0,1,1,0,0,0],[0,0,0,0,0,0,1,0,0,0]])).to eq(false)
#             expect(checker([[0,0,0,0,0,1,1,0,0,0],[0,0,0,0,0,1,0,0,0,0]])).to eq(false)
#         end
#         it "should return false if i == 0 and a vertic ship borders a ship on either side" do
#             expect(checker([[0,0,0,0,1,1,0,0,0,0],[0,0,0,0,0,1,0,0,0,0]])).to eq(false)
#             expect(checker([[0,0,0,0,0,1,0,0,0,0],[0,0,0,0,0,1,1,0,0,0]])).to eq(false)
#         end
#         it "should return true if i == 0 and a vertic ship borders no other ship to either side" do
#             expect(checker([[0,0,0,0,0,0,0,0,1,0],[0,0,0,0,0,0,0,0,1,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(true)
#             expect(checker([[0,0,0,0,0,1,0,0,0,0],[0,0,0,0,0,1,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(true)
#         end
#         it "should return true if j == 0 and a vertic ship borders no other ship to the right" do
#             expect(checker([[0,0,0,0,0,0,0,0,0,0],[1,0,0,0,0,0,0,0,0,0],[1,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(true)
#             expect(checker([[0,0,0,0,0,0,0,0,0,0],[1,0,0,0,0,0,0,0,0,0],[1,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(true)
#         end
#         it "should return false if j == 0 and a vertic ship borders a ship to the right of it" do
#             expect(checker([[0,0,0,0,0,0,0,0,0,0],[1,1,0,0,0,0,0,0,0,0],[1,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(false)
#             expect(checker([[0,0,0,0,0,0,0,0,0,0],[1,0,0,0,0,0,0,0,0,0],[1,1,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(false)
#             expect(checker([[0,0,0,0,0,0,0,0,0,0],[0,1,0,0,0,0,0,0,0,0],[1,0,0,0,0,0,0,0,0,0],[1,0,0,0,0,0,0,0,0,0]])).to eq(false)
#         end
#         it "should return true if j == 0 and a horz ship borders no other ship below or above it" do
#             expect(checker([[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[1,1,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(true)
#             expect(checker([[0,0,0,0,0,0,0,0,0,0],[1,1,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(true)
#         end
#         it "should return false if j == 0 and a horz ship borders a ship below or above it" do
#             expect(checker([[0,0,0,0,0,0,0,0,0,0],[0,1,0,0,0,0,0,0,0,0],[1,1,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(false)
#             expect(checker([[0,0,0,0,0,0,0,0,0,0],[1,1,0,0,0,0,0,0,0,0],[1,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]])).to eq(false)
#             expect(checker([[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[1,1,0,0,0,0,0,0,0,0],[0,1,0,0,0,0,0,0,0,0]])).to eq(false)
#         end
#     end    
# end

#     # describe "ship_count" do      
#     #         it "should take in a dimensional array(grid) as an argument" do 
#     #             grid = [[111],[222]]
#     #             expect (ship_count(grid)).to_not raise_error
#     #         end
#     #     end


#     # it "should return false if there are to few or to many ships"
#     # grid = [[1,0,1,1,0,1,1,0,1,1],[0,1,0,1,1,1,0,1,1,1],[0,0,0,1,1,1,1,0,0,0]]
#     # expect (validate_battlefield(grid)).to_not eq(false)