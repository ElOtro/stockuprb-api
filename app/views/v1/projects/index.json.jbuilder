json.data @projects do |project|
  json.partial! 'v1/projects/project', project: project
end
