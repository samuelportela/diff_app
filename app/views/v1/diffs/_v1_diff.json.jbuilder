json.extract! v1_diff, :id, :left, :right, :created_at, :updated_at
json.url v1_diff_url(v1_diff, format: :json)