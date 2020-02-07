# zd_intake_service = ZendeskIntakeService.new(intake)
# zd_intake_service.create_intake_ticket_requester
# zd_ticket_id = zd_intake_service.create_intake_ticket
# intake.update(zendesk_ticket_id: zd_ticket_id)

class ZendeskIntakeService
  def initialize(intake)
    @intake = intake
  end

  def create_intake_ticket_requester
  end

  def create_intake_ticket
    ticket = ZendeskAPI::Ticket.new({})
    return ticket.id
  end
end