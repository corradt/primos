json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :stand, :ragioneSociale, :telefono, :fax, :referente
  json.url merchant_url(merchant, format: :json)
end
