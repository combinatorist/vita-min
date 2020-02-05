module Questions
  class WidowedController < QuestionsController
    layout "yes_no_question"

    def section_title
      "Personal Information"
    end

    def self.show?(intake)
      intake.married_no?
    end

    def no_illustration?
      true
    end
  end
end