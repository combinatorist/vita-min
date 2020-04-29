# == Schema Information
#
# Table name: vita_partners
#
#  id                      :bigint           not null, primary key
#  display_name            :string
#  drop_off_code           :string
#  logo_url                :string
#  name                    :string           not null
#  referral_code           :string
#  zendesk_instance_domain :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  zendesk_group_id        :string           not null
#
require 'rails_helper'

RSpec.describe VitaPartner, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
