module ReviewsHelper
  def review_average(reviews)
    reviews.length > 0 ? (reviews.inject(0.00) {|sum, r| sum + r.rank} / reviews.length).round(2) : 0
  end
end
