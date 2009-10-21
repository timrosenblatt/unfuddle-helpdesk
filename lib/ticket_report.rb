class TicketReport < UnfuddleRecord  
  def self.find(id)
    hsh = get("https://#{Sinatra::Application.unfuddle_subdomain}.unfuddle.com/api/v1/projects/#{Sinatra::Application.unfuddle_project_id}/ticket_reports/#{id}/generate")['ticket_report']
    new(hsh)
  end
  
  attr_accessor :ticket_groups
  
  def initialize(hsh)
    @ticket_groups = hsh['groups'].map { |g| TicketGroup.new(g) }
  end
end