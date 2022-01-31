json.data @units do |unit|
  json.partial! 'v1/units/unit', unit: unit
end
