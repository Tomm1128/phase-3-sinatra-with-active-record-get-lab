class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
      baked_good = Bakery.all.find(params[:id])
      baked_good.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    goods_by_price = BakedGood.all.order(price: :desc)
    goods_by_price.to_json
  end

  get '/baked_goods/most_expensive' do
    most_expensive_good = BakedGood.all.order(price: :desc).first
    most_expensive_good.to_json
  end
end
