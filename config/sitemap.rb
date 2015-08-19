# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://interlavka.su"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do

  add '/about.html', :changefreq => 'monthly', :priority => 1.0

  Article.find_each do |article|
    add article_path(article), :lastmod => article.updated_at, :changefreq => 'monthly', :priority => 1.0
  end

  User.find_each do |user|
    add user_path(user), :lastmod => user.created_at, :changefreq => 'monthly', :priority => 0.7
  end

  add '/contacts.html', :priority => 0.3, :changefreq => 'yearly'
end
