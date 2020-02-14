# == Schema Information
#
# Table name: documents
#
#  id            :bigint           not null, primary key
#  document_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  intake_id     :bigint
#
# Indexes
#
#  index_documents_on_intake_id  (intake_id)
#

class Document < ApplicationRecord
  # For the document overview page, we need a mapping of which controller
  # corresponds to which Document Type.
  DOCUMENT_CONTROLLERS = {
    "W-2" => Questions::W2sController,
    "1095-A" => Questions::Form1095asController,
    "1098" => Questions::Form1098sController,
    "1098-E" => Questions::Form1098esController,
    "1098-T" => Questions::Form1098tsController,
    "1099" => Questions::Form1099sController,
    "1099-A" => Questions::Form1099asController,
    "1099-B" => Questions::Form1099bsController,
    "1099-C" => Questions::Form1099csController,
    "1099-DIV" => Questions::Form1099divsController,
    "1099-G" => Questions::Form1099dashgsController,
    "1099-INT" => Questions::Form1099intsController,
    "1099-K" => Questions::Form1099ksController,
    "1099-MISC" => Questions::Form1099miscsController,
    "1099-R" => Questions::Form1099rsController,
    "1099-S" => Questions::Form1099ssController,
    "1099-SA" => Questions::Form1099sasController,
    "1099-SSDI" => Questions::Form1099ssdisController,
    "1099G" => Questions::Form1099gsController,
    "5498-SA" => Questions::Form5498sasController,
    "IraStatement" => Questions::FormIrastatementsController,
    "property_tax_statement" => Questions::FormPropertyTaxStatementsController,
    "RRB-1099" => Questions::FormRrb1099sController,
    "ssn_itin" => Questions::FormSsnItinsController,
    "SSA-1099" => Questions::FormSsa1099sController,
    "student_account_statement" => Questions::FormStudentAccountStatementsController,
    "W-2G" => Questions::FormW2gsController,
    "2018_return" => Questions::Form2018ReturnsController,
    "Other" => Questions::AdditionalDocumentsController,
  }.freeze
  DOCUMENT_TYPES = DOCUMENT_CONTROLLERS.keys.freeze

  validates :document_type, inclusion: { in: DOCUMENT_TYPES }
  validates :intake, presence: true

  scope :of_type, ->(type) { where(document_type: type) }

  belongs_to :intake
  has_one_attached :upload
end
