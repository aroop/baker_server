xml.instruct!

xml.feed "xmlns" => "http://www.w3.org/2005/Atom", 'xmlns:news' => 'http://itunes.apple.com/2011/Newsstand' do
  xml.updated @issues.collect(&:updated_at).max.xmlschema

  @issues.each do |issue|
    xml.entry do
      xml.id issue.issue_id
      xml.updated issue.updated_at.xmlschema
      xml.published issue.published_date.xmlschema
      xml.summary issue.summary
      xml.download_url download_issue_url(issue, format: 'json')
      xml.news :end_date do
        if issue.end_date.present?
          xml.text! issue.end_date.xmlschema
        end
      end
      xml.news :cover_art_icons do |art|
        if issue.cover_art.present?
          art.news :cover_art_icon, {"size" => "SOURCE", "src" => qualified_url(issue.cover_art.url)}
        end
      end
    end
  end
end