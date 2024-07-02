# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
require 'json'
require 'faker'

def fetch_and_create_anime(page)
  url = "https://api.jikan.moe/v4/anime?page=#{page}&limit=25"  # API限制每页最多25条
  response = URI.open(url).read
  data = JSON.parse(response)["data"]

  data.each do |anime_data|
    # 随机生成一个类型
    type_name = Faker::Book.genre
    type = Type.find_or_create_by(name: type_name)

    # 提取季节数据
    season_name = anime_data["season"] || "Unknown"
    year = anime_data["year"] || 2020
    season = Season.find_or_create_by(name: season_name, year: year)

    # 创建Anime记录
    anime = Anime.create!(
      title: anime_data["title"],
      background: anime_data["background"],
      favorites: anime_data["favorites"],
      type: type,
      season: season
    )

    # 为每个动漫创建一个Heat记录，随机分数
    Heat.create!(anime: anime, value: Faker::Number.between(from: 0, to: 100))
  end
end

# 抓取8页数据
(1..8).each { |page| fetch_and_create_anime(page) }
