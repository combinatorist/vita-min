module Questions
  class ChatWithUsController < QuestionsController
    layout "question"

    private

    def illustration_path
      current_intake.vita_partner&.logo_url
    end

    def self.form_class
      NullForm
    end
  end
end
