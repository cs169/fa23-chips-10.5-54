# frozen_string_literal: true

When 'I click Add News Article' do
  page.find(:css,
            'body > div > div.flex-grow-1 > div > div > div > div >
            div.clearfix.my-4 > div > a.mx-1.btn.btn-primary').click
end

When 'I select {string} and {string}' do |rep, issue|
  select(rep, from: 'news_item[representative_id]')
  select(issue, from: 'news_item[issue]')
end

When 'I choose the Betye Saar Reassembles the Lives of Black Women' do
  choose('article_0')
end
