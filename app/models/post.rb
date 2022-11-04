class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :title, :clickbait?

    BAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
      ]
      
    def clickbait?
        if BAIT_PATTERNS.none? { |pattern| pattern.match(title) }
          errors.add(:title, "must be clickbait")
        end
      end


    # def no_clickbait
    #     unless title.present? && title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
    #     errors.add(:title, 'Your title is not clickbait-y')
    #     end
    # end
end

