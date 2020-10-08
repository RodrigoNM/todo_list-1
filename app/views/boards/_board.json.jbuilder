json.extract! board, :id, :description, :task_id, :created_at, :updated_at
json.url board_url(board, format: :json)
