require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ReviewsHelper, type: :helper do
  describe "review_average" do
    it "レビューがない場合は 0 を返す" do
      expect(review_average([])).to eq 0
    end

    it "レビューがある場合は、その平均点を返す" do
      expect(review_average([create(:review, rank: 2), create(:review, rank: 4)])).to eq 3
    end
    
    it "レビューがある場合は、その平均点を返す(小数あり)" do
      expect(review_average([create(:review, rank: 3), create(:review, rank: 4)])).to eq 3.5
    end
    
    it "レビューがある場合は、その平均点を四捨五入で返す(小数２位まであり)" do
      expect(review_average([create(:review, rank: 2), create(:review, rank: 4), create(:review, rank: 5)])).to eq 3.67
    end
    
  end
end
