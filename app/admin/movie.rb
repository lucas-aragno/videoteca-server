ActiveAdmin.register Movie do
  permit_params :title, :rate, :desc, :link, :image_url, :category_id
end
