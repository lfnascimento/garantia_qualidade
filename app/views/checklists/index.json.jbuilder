json.array!(@checklists) do |checklist|
  json.extract! checklist, :id, :identificacao, :fase
  json.url checklist_url(checklist, format: :json)
end
