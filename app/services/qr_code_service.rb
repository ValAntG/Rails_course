module QrCodeService
  def self.generate_qr(text, ticket)
    require 'barby'
    require 'barby/barcode'
    require 'barby/barcode/qr_code'
    require 'barby/outputter/png_outputter'
    text_code = text_code(text, ticket)
    barcode = Barby::QrCode.new(text_code, level: :q, size: 11)
    base64_output = Base64.encode64(barcode.to_png(xdim: 5))
    "data:image/png;base64,#{base64_output}"
  end

  def self.text_code(text, ticket)
    text_code = "Ticket in train #{text[:train]}`\n
    'Station departure #{text[:station_first]} in #{text[:time_first].try(:strftime, '%H:%M')}`\n
    'Station arrival #{text[:station_last]} in #{text[:time_last].try(:strftime, '%H:%M')}.`\n
    'Family #{ticket.last_name}, Name #{ticket.first_name}.`\n
    'Documents #{ticket.passport_series} #{ticket.passport_numbers}"
  end
end
