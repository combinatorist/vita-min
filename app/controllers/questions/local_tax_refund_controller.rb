module Questions
  class LocalTaxRefundController < QuestionsController
    layout "yes_no_question"

    def section_title
      "Income and Expenses"
    end
  end
end