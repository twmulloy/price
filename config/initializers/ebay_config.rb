module EbayConfig
  
  EBAY = YAML.load_file("#{Rails.root.to_s}/config/ebay.yml")[Rails.env]
  
  def ebay_config
    EBAY
  end
  
end